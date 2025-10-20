class DownloadBinarioJob < ApplicationJob
  queue_as :default

  def perform(download_task_id)
    task = DownloadTask.find(download_task_id)
    bin = task.binario
    uri = URI.parse(bin.download_url)

    task.update!(status: :running, progress: 0)

    require 'net/http'
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      req = Net::HTTP::Get.new(uri)
      if bin.auth_username.present?
        req.basic_auth(bin.auth_username, bin.auth_password.to_s)
      end
      http.request(req) do |resp|
        total = resp['Content-Length'].to_i
        downloaded = 0
        tempfile = Tempfile.new(["binario", File.extname(uri.path)])
        begin
          resp.read_body do |chunk|
            tempfile.write(chunk)
            downloaded += chunk.bytesize
            if total > 0
              pct = ((downloaded.to_f / total) * 100).floor.clamp(0, 100)
              task.update_column(:progress, pct)
            end
          end
          tempfile.rewind
          task.artifact.attach(io: tempfile, filename: File.basename(uri.path).presence || "download.bin")
        ensure
          tempfile.close!
        end
      end
    end

    task.update!(progress: 100, status: :done)
  rescue => e
    task.update_columns(status: DownloadTask.statuses[:failed], error_message: e.message)
  end
end