-- Función para copiar un archivo
function copyFile(sourcePath, destinationPath)
    local sourceFile = io.open(sourcePath, "rb")
    if not sourceFile then
        print("No se pudo abrir el archivo de origen.")
        return false
    end

    local destinationFile = io.open(destinationPath, "wb")
    if not destinationFile then
        sourceFile:close()
        print("No se pudo abrir el archivo de destino.")
        return false
    end

    local buffer = sourceFile:read("*a")
    destinationFile:write(buffer)

    sourceFile:close()
    destinationFile:close()

    print("Archivo copiado con éxito.")
    return true
end

-- Uso de la función
local sourcePath = "archivo_origen.txt"
local destinationPath = "archivo_destino.txt"

if copyFile(sourcePath, destinationPath) then
    print("¡Copia exitosa!")
else
    print("La copia del archivo falló.")
end
