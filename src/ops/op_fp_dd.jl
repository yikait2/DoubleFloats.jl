@inline function abs_fp_dd(x::T) where {T<:AbstractFloat}
    return abs(x), zero(T)
end

@inline function negabs_fp_dd(x::T) where {T<:AbstractFloat}
    return -abs(x), zero(T)
end

@inline function neg_fp_dd(x::T) where {T<:AbstractFloat}
    return -x, zero(T)
end

@inline function inv_fp_dd(x::T) where {T<:AbstractFloat}
    return inv_2(x)
end


@inline function powr2_fp_dd(x::T) where {T<:AbstractFloat}
    return powr2_(x)
end

@inline function powr3_fp_dd(x::T) where {T<:AbstractFloat}
    return powr3_(x)
end

@inline function powr4_fp_dd(x::T) where {T<:AbstractFloat}
    hi, lo3 = powr3_fp_dd(x)
    hi, lo = mul_(x, hi)
    lo = fma(lo3, x, lo)
    return hi, lo
end

@inline function powr5_fp_dd(x::T) where {T<:AbstractFloat}
    hi, lo4 = powr4_fp_dd(x)
    hi, lo = mul_(x, hi)
    lo = fma(lo4, x, lo)
    return hi, lo
end

@inline function powr6_fp_dd(x::T) where {T<:AbstractFloat}
    hi, lo5 = powr5_fp_dd(x)
    hi, lo = mul_(x, hi)
    lo = fma(lo5, x, lo)
    return hi, lo
end


@inline function root2_fp_dd(x::T) where {T<:AbstractFloat}
    return root2_(x)
end

@inline function root3_fp_dd(x::T) where {T<:AbstractFloat}
    return root3_(x)
end

@inline function root4_fp_dd(x::T) where {T<:AbstractFloat}
     return root2_(sqrt(x))
end

@inline function root5_fp_dd(x::T) where {T<:AbstractFloat}
    throw(ErrorException("not implemented"))
end

@inline function root6_fp_dd(x::T) where {T<:AbstractFloat}
    return root3_(sqrt(x))
end
