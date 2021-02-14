using CSV
using DataFrames

main_fn = ARGS[1]
with_fn = ARGS[2]
ret_fn = ARGS[3]
main_csv = CSV.read(main_fn)
with_csv = CSV.read(with_fn)
ret_csv = DataFrames.join(main_csv, with_csv, on="震度観測点名称", kind=:left)
CSV.write(ret_fn, ret_csv)
