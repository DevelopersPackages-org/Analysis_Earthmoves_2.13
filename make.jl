using CSV
using DataFrames

main_fn = ARGS[1]
aft_fn = ARGS[2]

main_csv = CSV.read(main_fn)
w = open(aft_fn, "w")
write(w, main_csv)
close(w)