#!/bin/bash
#
# Script que permite *Activar*, *Cambiar* y *Desactivar* 
# el sonido de Inicio de Canaima GNU Linux V4.
# Copyleft 2013, Venezuela {Guarico, Calabozo}.
# Nombre Autor: Wuilmer Bolivar <el.wuilmer@gmail.com>
# Contacto: Twitter: @WuilmerBolivar
#
# -*- ENCODING: UTF-8 -*-
# Este script es Software Libre. Puede redistribuirlo y/o modificarlo 
# bajo los términos de la Licencia Pública General de GNU 
# según es publicada por la Free Software Foundation, bien de la 
# versión 3 de dicha Licencia o bien de cualquier versión posterior.
#
# Si usted hace alguna modificación en esta aplicación,
# deberá siempre mencionar al autor original de la misma.
#
# Debería haber recibido una copia de la Licencia Pública General GNU 
# junto a este programa. En caso contrario,
# Consulte <http://www.gnu.org/licenses/>.

# Iniciamos nuestro script declarando las variables
# USR = Verificamos que iniciamos el scrip como usuario root.
# DIR = Nos ubicamos en el directorio de trabajo actual.
# RUTA = Donde se encuentra el archivo de sonido.
# ARCHIVO = Nombre del archivo de sonido.

USR=$(whoami)
DIR=$(pwd)
RUTA=/usr/share/sounds/freedesktop/stereo
ARCHIVO=desktop-login.oga

TITLE=".:MENÚ:."

# Condicionamos que el usuario sea root, caso contrario salimos del script.
	if [ $USR != "root" ]; then
		zenity --info --text="Necesita ejecutar el archivo como root."
		exit 1
	fi

# Establecemos las opciones del menú.
# A las opciones asignamos un valor del 0 al 3, 
# de acuerdo al valor seleccionado ejecutamos la 
# opción correspondiente.

Main () {
OPCION=$(zenity --cancel-label="Salir" --height=230 --list --title "$TITLE" --hide-column 1 --text "Operaciones del sonido." --column "" --column "Opciones disponibles: " \
"0" "Activar" \
"1" "Cambiar" \
"2" "Desactivar" \
"3" "Información")

	if [ $OPCION = 0 ]; then
		Activar
	fi
	if [ $OPCION = 1 ]; then
		Cambiar
	fi
	if [ $OPCION = 2 ]; then
		Desactivar
	fi
	if [ $OPCION = 3 ]; then
		Informacion
	fi
}

# Opción "Activar", verificamos que el archivo existe,
# Si existe mostramos en pantalla que ya se encuentra activo.
# Caso contrario renombramos a: desktop-login-RESPALDO.oga

Activar () 
{
	if [ -f $RUTA/$ARCHIVO ]; then
		zenity --error --text "El Sonido ya se encuentra Activo..."
	elif [ -f $RUTA/desktop-login-RESPALDO.oga ]; then
		mv $RUTA/desktop-login-RESPALDO.oga $RUTA/$ARCHIVO
	else
		zenity --warning --text="No se encuentra el archivo desktop-login.oga" 
	fi
Main
}

# Opción "Cambiar", verificamos que el archivo este activo,
# Si no esta activo pedimos sea activado.
# Hacemos respaldo del sonido original.
# Y copiamos el archivo selecionado por el usuario.

Cambiar () 
{
	if [ -f $RUTA/desktop-login-RESPALDO.oga ]; then
		zenity --error --text "Debe encender el sonido."
	fi

	if [ -f $RUTA/$ARCHIVO ]; then
		NUEVO=`zenity --file-selection --title="Seleccione un archivo"`
		mv $RUTA/$ARCHIVO $RUTA/desktop-login-ORIGINAL.oga
		cp $NUEVO $RUTA/$ARCHIVO
		zenity --info --text "Sonido reemplazado correctamente."
	else
		zenity --warning --text="No se encuentra el archivo desktop-login.oga" 
	fi
Main
}

# Opción "Desactivar", verificamos que el archivo no este Desactivado,
# Si esta desactivado, mostramos en pantalla que ya esta desactivado.
# Caso contrario renombramos a: desktop-login-RESPALDO.oga

Desactivar () 
{
	if [ -f $RUTA/desktop-login-RESPALDO.oga ]; then
		zenity --error --text "El Sonido ya se encuentra Desactivado..."
	elif [ -f $RUTA/$ARCHIVO ]; then
		mv $RUTA/$ARCHIVO $RUTA/desktop-login-RESPALDO.oga 
	else
		zenity --warning --text="No se encuentra el archivo desktop-login.oga" 
	fi
Main
}

# Muestra información del archivo README.
Informacion () 
{
	README=`dirname $0`/README.rst
	INFORMACION=`zenity --cancel-label="Menu" --text-info --height=400 --width=650 --title="Acerca de..." --filename=$README --checkbox="Ya he leído todo."`
Main
}


Main
