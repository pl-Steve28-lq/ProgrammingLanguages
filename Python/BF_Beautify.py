def beautify(code):
    pad = 0
    isLoop = False
    isApp = False
    res = [""]
    for i in code:
        if i == "[":
            res.append("  "*pad + i)
            pad += 1
            isLoop = True
            isApp = False
        elif i == "]":
            pad -= 1
            res.append("  "*pad + i)
            isLoop = False
            isApp = False
        elif isApp:
            res[-1] += i
        elif isLoop and not isApp:
            res.append("  "*pad + i)
            isApp = True
    return '\n'.join(res)
