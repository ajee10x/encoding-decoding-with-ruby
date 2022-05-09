# ajee10x
# base64 encoding decoding strings with ruby


module Base64
  module_function


  # This method complies with RFC 2045.
  
  def encode64(bin)
    [bin].pack("m")
  end

  def decode64(str)
    str.unpack1("m")
  end

  def strict_encode64(bin)
    [bin].pack("m0")
  end

  def strict_decode64(str)
    str.unpack1("m0")
  end

  # Alphabet'' in RFC 4648.

  def urlsafe_encode64(bin, padding: true)
    str = strict_encode64(bin)
    str.chomp!("==") or str.chomp!("=") unless padding
    str.tr!("+/", "-_")
    str
  end

  def urlsafe_decode64(str)

    if !str.end_with?("=") && str.length % 4 != 0
      str = str.ljust((str.length + 3) & ~3, "=")
      str.tr!("-_", "+/")
    else
      str = str.tr("-_", "+/")
    end
    strict_decode64(str)
  end
end
# © most works for jcmfernandes 
