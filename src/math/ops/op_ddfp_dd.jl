@inline function add_ddfp_dd(x::Tuple{T,T}, y::T) where {T<:IEEEFloat}
    hi, lo = x
    hi, lo = two_sumof3(hi, y, lo)
    return hi, lo
end

@inline function sub_ddfp_dd(x::Tuple{T,T}, y::T) where {T<:IEEEFloat}
    hi, lo = x
    hi, lo = two_sumof3(hi, lo, -y)
    return hi, lo
end

@inline function mul_ddfp_dd(x::Tuple{T,T}, y::T) where {T<:IEEEFloat}
    hi, lo = x
    hihi, hilo = two_prod(y, hi)
    lohi, lolo = two_prod(y, lo)
    hi, lo = two_sumof4(hihi, hilo, lohi, lolo)
    return hi, lo
end

@inline function dvi_ddfp_dd(x::Tuple{T,T}, y::T) where {T<:IEEEFloat}
    yinv = inv_fp_dd(y)
    zhi, zlo = mul_dddd_dd(x, yinv)
    return zhi, zlo
end
