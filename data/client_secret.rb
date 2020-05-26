require 'jwt'

key_file = '/root/data/key.txt'
team_id = "${TEAM_ID}"
client_id = "${CLIENT_ID}"
key_id = "${KEY_ID}"

ecdsa_key = OpenSSL::PKey::EC.new IO.read key_file

headers = {
'kid' => key_id
}

claims = {
    'iss' => team_id,
    'iat' => Time.now.to_i,
    'exp' => Time.now.to_i + 86400*180,
    'aud' => 'https://appleid.apple.com',
    'sub' => client_id,
}

token = JWT.encode claims, ecdsa_key, 'ES256', headers

puts "*******************************"
puts ">>> Your Apple Secret Key is: "
puts ""
puts token
puts ""
puts "*******************************"