WickedPdf.configure do |config|

  config.exe_path = if Rails.env.production?
                      '/usr/bin/wkhtmltopdf' # Render環境のパス
                    else
                      '/home/shinji/.rbenv/shims/wkhtmltopdf'
                    end

                  # デフォルトのオプションを設定
  config.default_options = {
  #   # layout: 'pdf.html',          # レイアウトファイルを指定
  #   encoding: 'UTF-8',           # エンコーディング
  #   page_size: 'A5',             # ページサイズ
  #   # orientation: 'Landscape',    # 横向きに設定
  #   javascript_delay: 1000,      # JavaScriptの実行を待つ時間（ミリ秒）
  #   debug_javascripts: true,     # スクリプトのデバッグ
  #   dpi: 300                     # 出力の解像度
    font_path: '/tmp/fonts/NotoSansCJK-Regular.ttc' # フォントファイルのパス
  }
end
