WickedPdf.configure do |config|

  config.exe_path = if Rails.env.production?
                      '/usr/bin/wkhtmltopdf' # Render環境のパス
                    else
                      '/home/shinji/.rbenv/shims/wkhtmltopdf'
                    end

  config.default_options = {
    encoding: 'UTF-8',           # エンコーディング
    enable_local_file_access: true, # ローカルファイルの読み込みを許可
    font_path: '/opt/render/project/.fonts/NotoSansCJK-Regular.ttc',
    custom_styles: "body { font-family: 'Noto Sans CJK', sans-serif; }",
    orientation: 'Landscape'    # 横向きに設定
  }
end
