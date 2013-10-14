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

function timing
{
for i in `seq 1 100`
do
    echo "$i"
    sleep 0.09
done
}

timing | zenity --cancel-label="Omitir" --progress --title=".:BIENVENIDO:." --text="Script que te permite Desactivar/Cambiar \nImagen y Sonido de la pantalla de Inicio \nde CanaimaGNULinux 4.0 \n         Creado por: Wuilmer Bolivar " --percentage=0 --auto-close

USR=$(whoami)
DIR=$(pwd)

TITLE=".:CANAIMA GNU LINUX:."

	if [ $USR != "root" ]; then
		zenity --info --text="Necesita ejecutar el archivo como root."
		exit 1
	fi


#--window-icon-cancel=$DIR/ico/salir.png
Main () {
OPCION=$(zenity --cancel-label="Salir"  --title "$TITLE" --height=200 --width=350 --text "Imagen/Sonido de Inicio de CanaimaGNULinux 4.0" --list \
  --hide-column 1 --column="id" --column="Opción" --column="Descripción" \
 	 "0" 	"Imagen" 	"Permite cambiar la imagen de inicio." \
 	 "1" 	"Sonido" 	"Permite cambiar el sonido de inicio." \
 	 "2" 	"Acerca" 	"Acerca de este script.")

	if [ $OPCION = 0 ]; then
		Imagen
	fi
	if [ $OPCION = 1 ]; then
		Sonido
	fi
	if [ $OPCION = 2 ]; then
		Acerca
	fi
}

Imagen (){
	if [ -f $DIR/ImagenCanaima.sh ]; then
		$DIR/ImagenCanaima.sh
	else
		zenity --error --text "No se encuentra el Script: ImagenCanaima.sh"
	fi
Main
}

Sonido (){
	$DIR/SonidoCanaima.sh
Main
}

Acerca (){
	README=`dirname $0`/README.rst
	INFORMACION=`zenity --cancel-label="Menu" --text-info --height=400 --width=650 --title="Acerca de..." --filename=$README --checkbox="Ya he leído todo."`
Main
}

Main
