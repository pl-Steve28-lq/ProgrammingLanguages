def hangeulSeperator(string):
  pc = list("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ")
  mc = list("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ")
  lc = list(" ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ")

  base = 44032
  ch = 588
  js = 28
  res = []

  for i in list(string):
    chars = ord(i) - base
    ch1 = int(chars/ch)
    ch2 = int((chars - ch*ch1)/js)
    res.append(pc[ch1])
    res.append(mc[ch2])
    res.append(lc[int((chars - ch*ch1 - js*ch2))])
  return res
