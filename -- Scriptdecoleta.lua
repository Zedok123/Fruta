-- Scriptdecoleta

local ativarColeta = true

function encontrarFrutas()
    for i, objeto in pairs(game.Workspace:GetChildren()) do
        if objeto:IsA("Tool") and objeto.Name == "Fruit" then
            return objeto
        end
    end
    return nil
end

function moverParaFruta(fruta)
    local jogador = game.Players.LocalPlayer
    local personagem = jogador.Character or jogador.CharacterAdded:Wait()
    personagem:MoveTo(fruta.Position)
end

while true do
    if ativarColeta then
        local fruta = encontrarFrutas()
        if fruta then
            moverParaFruta(fruta)
        end
    end
    wait(1)
end

function alternarColeta()
    ativarColeta = not ativarColeta
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == "!coleta" then
        alternarColeta()
    end
end)
