#/bin/bash
# Scrpit de inicializacion del nodo eth, hay que ejecutarla como root o sudo
if [ $(id -u) -ne 0 ]; then
  echo "Please run as root"
  exit;
fi
DATADIR=/var/lib/ethereum
# Verificando la configuracion antigua:
echo "Checking up old config at:"
echo $DATADIR
if [ -d $DATADIR ]; then
	echo "THERE IS CURRENLTY A GENESIS NODE GENERATED IN THE DATA DIR, IT WILL BE USED TO START THE BOOTNODE"
else
	echo "Initalizing the genesis node:"
	geth --datadir $DATADIR/ethereum init config/genesis.json
fi

# Creando la pareja de llaves
echo "Setting up the bootnode:"
if [ ! -e $DATADIR/boot.key ]; then
	echo "Generating the bootnode keypair:"
	bootnode --genkey=$DATADIR/boot.key
fi
bootnode --nodekey=$DATADIR/boot.key
