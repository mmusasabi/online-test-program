require 'open-uri'

def query(url)
  res = open(url)
  res.string
end

token  = ""

# 文章ルール
# 1 文字以上 50 文字以内の「A」「B」「C」「D」で、ある。

hash = ["A","B","C","D"]

# 2.times.each do |i|
# end

# hash.each do |s|
#   str    = s #"ABCD"
#   url    = "https://runner.team-lab.com/q?token=#{token}&str=#{str}"
#   result = query(url)

#   puts "str: #{str} score: #{result}"

#   sleep 1 # "Too Frequent Access" 対策
# end

## 高配当な八文字探し

["A"].each do |s|
  ["A"].each do |s2|
    ["C"].each do |s3|
      ["D"].each do |s4|
        hash.each do |s5|
          hash.each do |s6|
            hash.each do |s7|
              check = ""

              hash.each do |s8|
                str    = s + s2 + s3 + s4 + s5 + s6 + s7 + s8

                check = check + str + "Z"
              end

              url    = "https://runner.team-lab.com/q?token=#{token}&str=#{check}"
              result = query(url)

              if result.to_i >= 240
                puts "check: #{check} score: #{result}"
              end

              sleep 1 # "Too Frequent Access" 対策
            end
          end
        end
      end
    end
  end
end


hash.each do |s|
  hash.each do |s2|
    hash.each do |s3|
      check = ""

      hash.each do |s4|        
        ["D"].each do |s5|
          ["C"].each do |s6|
            ["B"].each do |s7|
              ["D"].each do |s8|
                str    = s + s2 + s3 + s4 + s5 + s6 + s7 + s8
                check = check + str + "Z"
              end
            end
          end
        end
      end
      url    = "https://runner.team-lab.com/q?token=#{token}&str=#{check}"
      result = query(url)

      if result.to_i >= 240
        puts "check: #{check} score: #{result}"
      end

      sleep 1 # "Too Frequent Access" 対策
    end
  end
end



# 時間がもったいないので思考時間はこれでランダムアタックする

# now_str = "CCDABDAACCDCAACCCCCADBDDCBAAABDDABDDDABABCDDBDDACB"
# score   = 1060

str =  "DCBACBCDDADCADCCDCCABABBACBCACCBDCBDBADBACBDBACBBD"
score = 1167

200.times.each do |i|
  old = ""
  str = ""

  50.times.each do |ii|
    # アルファベット隣り合っても良いパターン
    str = str + hash.shuffle[0]

    # アルファベット隣り合わないパターン
    # choice = hash.shuffle[0]
    # if choice != old
    #   str = str + choice
    # else
    #   choice = hash.shuffle[1]
    #   str = str + choice
    # end
    # old = choice
  end

  url    = "https://runner.team-lab.com/q?token=#{token}&str=#{str}"
  result = query(url)

  if result.to_i >= score
    score = result.to_i
    puts "str: #{str}"
    puts "score update!: #{result}"
  end

  sleep 1 # "Too Frequent Access" 対策
end

# https://runner.team-lab.com/q?token=&str=ABCDXABCDYABCDZ
