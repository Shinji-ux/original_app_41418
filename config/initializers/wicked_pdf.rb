WickedPdf.configure do |config|
  config.exe_path = '/home/shinji/.rbenv/shims/wkhtmltopdf'

  # デフォルトのオプションを設定
  # config.default_options = {
  #   layout: 'pdf.html',          # レイアウトファイルを指定
  #   encoding: 'UTF-8',           # エンコーディング
  #   page_size: 'A5',             # ページサイズ
  #   orientation: 'Landscape',    # 横向きに設定
  #   javascript_delay: 1000,      # JavaScriptの実行を待つ時間（ミリ秒）
  #   debug_javascripts: true,     # スクリプトのデバッグ
  #   dpi: 300                     # 出力の解像度
  # }
end
