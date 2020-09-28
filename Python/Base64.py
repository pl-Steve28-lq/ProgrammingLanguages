def encode64(text):
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    base64 = list(alphabet + alphabet.lower() + "0123456789+/")
    
    binary = ""
    for i in text:
        a = bin(ord(i))[2:]
        binary += "0"*(8-len(a)) + a
    padding = len(binary)%6
    if padding:
        binary += "0"*(6-padding)
    b = [base64[int(binary[i:i+6],2)] for i in range(0,len(binary),6)]
    return ''.join(b)+"="*padding

def decode64(text):
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    base64 = list(alphabet + alphabet.lower() + "0123456789+/")
    padding = text.count("=")
    text = text.replace("=", "")
    
    inverse = []
    for i in text:
        v = bin(base64.index(i))[2:]
        inverse.append("0"*(6-len(v)) + v)
    binary = ''.join(inverse)[:-padding]
    b = [int(binary[i:i+8],2) for i in range(0,len(binary),8)]
    return ''.join(map(chr, b))
