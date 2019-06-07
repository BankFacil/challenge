#### Configurando Ambiente Linux ####

# Configurar do RVM
- 'sudo apt-get update'
- Passo 1. Abra um terminal (no Unity use as teclas CTRL + ALT + T);
- colar o codigo "gpg --keyserver hkp://keys.gnupg.net --recv-keys    409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"
- colar o codigo "\curl -sSL https://get.rvm.io | bash -s stable"
- colar p codigo "rvm install 2.3.1"

# Instalando o JRE/JDK padrão
- copiar no terminal "sudo apt-get update"
- copiar no terminal "sudo apt-get install default-jre"
- copiar no terminal "sudo apt-get install default-jdk"

> Definindo a variável de ambiente "JAVA_HOME"
- sudo update-alternatives --config java

> (VOCÊ PEGA O CAMINHO DO PATH. 
O caminho da instalação para cada um é 'Ex':

1. /usr/lib/jvm/java-7-oracle
2. /usr/lib/jvm/java-6-openjdk-amd64
3. /usr/lib/jvm/java-7-oracle)

> Copie o caminho da sua instalação preferida e então edite o arquivo /etc/environment:
- 'sudo nano /etc/environment'
> Nesse arquivo, adicione a seguinte linha (substituindo SEU_CAMINHO pelo caminho copiado):
- JAVA_HOME="SEU_CAMINHO_do_path"
>Isto deve ser suficiente para definir a variável de ambiente. Agora recarregue este arquivo:
- 'source /etc/environment'
> Faça um teste executando:
- 'echo $JAVA_HOME'
> Link para respostas: https://www.digitalocean.com/community/tutorials/como-instalar-o-java-no-ubuntu-com-apt-get-pt

# Instalando node js
- 'sudo apt-get update'
- 'sudo apt-get install nodejs'
- 'node -v' para ver a versão do node instalado
- 'sudo apt-get install npm'
- 'npm -v' para ver a versão do node instalado

> install *chromedriver
- 'npm install chromedriver'

> install *geckodriver
- 'npm install geckodriver'

# instalar Gem Bundler
- colar o comando no terminal "gem install bundler"
> Link para respostas: http://bundler.io/

# Instalando o Git
- 'sudo apt-get update'
- 'sudo apt-get install git'
> Link para respostas: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-16-04

# Instalar uso do projeto
01. no terminal "bundler install" na pasta do respectivo projeto
 - Projeto API
02. rodar o comando "cucumber -t @post"
 - Projeto_web - nova aba
03. rodar o comando "cucumber -t @nova_aba versao=/windows BROWSER=chrome"
 - Projeto_web - checkbox
03. rodar o comando "cucumber -t @checkbox versao=/dynamic_controls BROWSER=chrome"