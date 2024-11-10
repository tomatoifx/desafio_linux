#!/bin/bash

echo "Iniciando script de provisionamento de infraestrutura..."

# Removendo diretórios e grupos anteriores
echo "Removendo configurações antigas..."
rm -rf /publico /adm /ven /sec
groupdel GRP_ADM 2>/dev/null
groupdel GRP_VEN 2>/dev/null
groupdel GRP_SEC 2>/dev/null

# Removendo usuários anteriores
echo "Removendo usuários anteriores..."
usuarios=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")
for usuario in "${usuarios[@]}"
do
    userdel -r $usuario 2>/dev/null
done

# Criando diretórios
echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

# Criando grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuários do grupo ADM
echo "Criando usuários do grupo ADM..."
useradd carlos -m -G GRP_ADM -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd maria -m -G GRP_ADM -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd joao -m -G GRP_ADM -s /bin/bash -p $(openssl passwd -crypt Senha123)

# Criando usuários do grupo VEN
echo "Criando usuários do grupo VEN..."
useradd debora -m -G GRP_VEN -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd sebastiana -m -G GRP_VEN -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd roberto -m -G GRP_VEN -s /bin/bash -p $(openssl passwd -crypt Senha123)

# Criando usuários do grupo SEC
echo "Criando usuários do grupo SEC..."
useradd josefina -m -G GRP_SEC -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd amanda -m -G GRP_SEC -s /bin/bash -p $(openssl passwd -crypt Senha123)
useradd rogerio -m -G GRP_SEC -s /bin/bash -p $(openssl passwd -crypt Senha123)

# Especificando permissões dos diretórios
echo "Configurando permissões dos diretórios..."
chown root:root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# Configurando permissões
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Script finalizado!"
echo "A infraestrutura foi criada com sucesso!"
