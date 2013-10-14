#!/bin/bash
#
# Script "Cambia Imagen/Sonido de inicio de CanaimaGNULinux"
# El siguiente script permite *Activar*, *Cambiar* y *Desactivar* 
# el sonido de Inicio de Canaima GNU Linux.
# Ademas permite cambiar la *Quitar* y *Cambiar*
# la imagen de inicio de CanaimaGNULinux.
#
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
# RUTA = Donde se encuentra la imagen.
# ARCHIVO = Nombre de la imagen.

USR=$(whoami)
DIR=$(pwd)
RUTA=/usr/share/images/desktop-base
ARCHIVO=login-background.png


TITLE=".:Imagen:."

# Condicionamos que el usuario sea root, caso contrario salimos del script.
	if [ $USR != "root" ]; then
		zenity --info --text="Necesita ejecutar el archivo como root."
		exit 1
	fi


Main () {
OPCION=$(zenity --cancel-label="Menú" --height=230 --list --title "$TITLE" --hide-column 1 --text "Operaciones de imagen." --column "" --column "Opciones disponibles: " \
"0" "Activar" \
"1" "Cambiar" \
"2" "Desactivar" \
"3" "Restablecer")

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
		Restablecer
	fi

}

Activar () 
{
	if [ -f $RUTA/$ARCHIVO ]; then
		zenity --error --text "La imagen ya se encuentra activa..."
	elif [ -f $RUTA/login-background-RESPALDO.png ]; then
		mv $RUTA/login-background-RESPALDO.png $RUTA/$ARCHIVO
	else
		zenity --warning --text="No se encuentra la imagen de inicio." 
	fi
Main
}

Cambiar () 
{
	if [ -f $RUTA/login-background-RESPALDO.png ]; then
		zenity --error --text "Necesita activar la imagen de inicio."
		exit
	fi

	if [ -f $RUTA/$ARCHIVO ]; then
		NUEVO=`zenity --file-selection --title="Seleccione un archivo"`; 
		SELECT=$(echo $?)

			if  [ $SELECT = "1" ]; then
				echo ""	
	else
		mv $RUTA/$ARCHIVO $RUTA/login-background-ORIGINAL.png
		cp $NUEVO $RUTA/$ARCHIVO
		zenity --info --text "Imagen reemplazada correctamente."
			fi
	fi
Main
}

Desactivar () 
{
	if [ -f $RUTA/login-background-RESPALDO.png ]; then
		zenity --error --text "La imagen se encuentra desactivada..."
	elif [ -f $RUTA/$ARCHIVO ]; then
		mv $RUTA/$ARCHIVO $RUTA/login-background-RESPALDO.png 
	else
		zenity --warning --text="No se encuentra la imagen de inicio." 
	fi
Main
}

Restablecer () 
{
	if [ -f $RUTA/login-background-RESPALDO.png ]; then
		zenity --error --text "Necesita activar la imagen de inicio."
		exit
	fi

	if [ -f $RUTA/login-background-ORIGINAL.png ]; then
		mv $RUTA/login-background-ORIGINAL.png $RUTA/$ARCHIVO
	else
		zenity --error --text "La imagen no ha sido cambiada..."

	fi
Main
}

Main
