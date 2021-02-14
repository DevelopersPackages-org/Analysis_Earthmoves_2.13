function sque(r)
    if startswith(r, "<tr><td>")
        ra = replace(r, "<tr><td>" => "")
        rb = replace(ra, "</td><td>" => ",")
        rc = replace(rb, "</td></tr>" => "")
        rc
    else
        ""
    end
end

function isnotblank(d)
    if d == ""
        false
    else
        true
    end
end


function doing(name)
    f = open("" * name * ".ehtml", "r")
    data = read(f, String)
    close(f)
    lines = split(data, "\n")
    ret = map(x -> sque(x), lines)
    reta = filter(isnotblank, ret)
    ans = join(reta, "\n")
    #   print(ans)
    head = "震度計番号,震度観測点名称,x,y,震度,最大加速度NS[cm/s/s],最大加速度EW[cm/s/s],最大加速度UD[cm/s/s],最大加速度3成分合成[cm/s/s],最大速度NS[cm/s],最大速度EW[cm/s],最大速度UD[cm/s],最大速度3成分合成[cm/s],最大変位NS[cm],最大変位EW[cm],最大変位UD[cm],最大変位3成分合成[cm]"
    body = [head,ans]
    body_txt = join(body, "\n")
    w = open("" * name * ".csv", "w")
    write(w, body_txt)
    close(w)
end

map(x -> doing(x), ARGS)