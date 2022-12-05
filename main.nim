import pixie
import std/sequtils

func getDivisors(n: uint): seq[uint] =
  for i in 1..n:
    if n mod i == 0:
      result.add i

when isMainModule:
  let
    chars = readFile("main.nim").toSeq()
    ds = getDivisors(chars.len.uint)
  let
    w: uint = ds[uint(floor(ds.len / 2) - 1)]
    h: uint = ds[uint(floor(ds.len / 2))]
  var img: Image = newImage(w.int, h.int)

  for i in 0..w*h - 1:
    img.data[i].r = chars[i].uint8
    img.data[i].g = chars[i].uint8
    img.data[i].b = chars[i].uint8
    img.data[i].a = 255

"main.png".writeFile(img.encodeImage(PngFormat))
