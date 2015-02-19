module TracksHelper
  def ugly_lyrics lyrics
    lyrics.scan(/[A-Z][^A-Z]*/).map do |line|
      "&#9835" + html_escape(line)
    end.join("\n").html_safe
  end
end
