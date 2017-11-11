type arcoMCMF
    origen::Int64
    destino::Int64
    capacidad::Int64
    cost::Int64
end

type gMCMF
    nVertices::Int64
    nArcos::Int64
    arcos::Array{arcoFlow,1} #arco[i,j] indica la distancia entre i y j 
end


function generarGrafoSparse(n::Int64,sp::Float64,maxValue::Int64,maxCost::Int64)
    nArcos=0
    a=arcoFlow[]
    for i in 1:n
        for j in i+1:n
            if rand() <= 2.0*sp
                nArcos += 1
                if randn() < 0.0
                    push!(a,arcoFlow(i,j,rand(1:maxValue),rand(1:maxCost)))
                else
                    push!(a,arcoFlow(j,i,rand(1:maxValue),rand(1:maxCost)))
                end
            end
        end
    end
    return gMCMF(n,nArcos,a) 
end

