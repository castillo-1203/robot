import discord
import os
from botci import *
a=0
# La variable intents almacena los privilegios del bot
intents = discord.Intents.default()
# Activar el privilegio de lectura de mensajes
intents.message_content = True
# Crear un bot en la variable cliente y transferirle los privilegios
client = discord.Client(intents=intents)
@client.event
async def on_ready():
    print(f'Hemos iniciado sesión como {client.user}')
@client.event
async def on_message(message):
    if message.author == client.user:
        return
    if message.content.startswith('$hello'):
        await message.channel.send("Bienbenido al Servidor de Miguel. Yo soy uno de los bots encargados de entretener y/o ayudar a los usuarios durante la ausencia del administrador principal. Si quiere saber lo que puedo hacer, por favor escriba la palabra $lista.")
    elif message.content.startswith('$bye'):
        await message.channel.send("\U0001f642")
    elif message.content.startswith('$lista'):
        await message.channel.send("Parece que a alguien le gustaría ver mis habilidades. En ese caso, estaré encantado por mostrarles los mensajes que activan cada uno diferentes funciones mias aquí: $contraseña , $emoji , $moneda , $hello y $bye. ¿Por cuál les gustaría empezar?")
    elif message.content.startswith('$contraseña'):
        await message.channel.send(gen_pass(10))
    elif message.content.startswith('$emoji'):
        await message.channel.send(gen_emodji())
    elif message.content.startswith('$moneda'):
        await message.channel.send(flip_coin())
    else:
        await message.channel.send(message.content)
client.run("token")
