require 'open-uri'

def query(url)
  res = open(url)
  res.string
end

token  = ""

# 文章ルール
# 1 文字以上 50 文字以内の「A」「B」「C」「D」で、ある。

require 'csv'
csv_file = "./score_db.csv"

# ヘッダーをシンボルに置き換える
header_converter = lambda {|h| h.to_sym}
csv_options = {
  headers: true, # headerあり
  header_converters: header_converter, # headerをシンボルに置き換え
  encoding: Encoding::UTF_8 # データはUTF-8
}
csv = CSV.read(csv_file, csv_options)

# データの検索
result = csv.select{|row| row.to_h if row.field?("A")}

[].empty? # 対象なし
result[0][0] # patern
result[0][1] # score

hash = ["A","B","C","D"]

hash.each do |s|
  result = csv.select{|row| row.to_h if row.field?(s)}
  s_p = result[0][0]
  s_score = result[0][1].to_i

  hash.each do |s1|
    result = csv.select{|row| row.to_h if row.field?(s1)}
    s1_p = result[0][0]
    s1_score = result[0][1].to_i

    if s_p == s1_p
      s1_score
    end

    str    = s + s1
    url    = "https://runner.team-lab.com/q?token=#{token}&str=#{str}"
    score = query(url).to_i
  
    puts "str: #{str} score: #{score}"
  
    if s_score + s1_score != score

      result = csv.select{|row| row.to_h if row.field?(str)}

      if result.empty?
        CSV.open(csv_file, "a") do |csv|
          csv.puts [str, score - (s_score + s1_score)]
        end
      end
    end
    
    sleep 1 # "Too Frequent Access" 対策
  end
end

