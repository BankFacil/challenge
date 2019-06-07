#### Instalando Ruby, Cucumber e Capybara no Windows 7, 8 e 10 ####

# Configurar o CMDDER
- Faça download do pacote FULL no site http://cmder.net/
- Descompactar na pasta C:\tools\Cmder (tem que criar a pasta neh)
- Executar o cmder.exe (cria um atalho e coloca onde tu quiser pra ficar mais pratico)

# Instalando Ruby 64 Bits
- Fazer download da versão 2.3.3 x64 http://rubyinstaller.org/downloads/
- Instalar no diretório C:\Ruby23-x64
- OBS: Antes de clicar em Install marca todas as opções conforme a imagem
- no CMD digitar o comando "ruby –v" 

# Instalando node js
- baixar o (Windows Installer (.msi)) https://nodejs.org/en/download/
- 'node -v' para ver a versão do node instalado
- 'npm -v' para ver a versão do node instalado

> install *chromedriver no CMD
- 'npm install chromedriver'

> install *geckodriver no CMD
- 'npm install geckodriver'

# Instalando Devkit 64 Bits
- http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe
- Descompactar no diretório C:\Ruby23-x64\devkit
- No Console do Cmder, acessar a pasta C:\Ruby23-x64\devkit, digite o comando ruby dk.rb init
- Agora abra o arquivo config.yml que foi gerado
- A ultima linha do arquivo deve conter o valor “ — C:/Ruby23-x64” (ignore as aspas duplas). Caso contrário faça o ajuste no arquivo.
- No Console do Cmder, digite o comando ruby dk.rb install
- Tudo deve ocorrer bem, caso contrário repita a operação desde o Passo C.

# Resolvendo o Problema de SSL 
- C:\> gem sources -a http://rubygems.org/
- C:\> gem sources -r https://rubygems.org/
- gem sources –u

# instalar Gem Bundler
- colar o comando no terminal "gem install bundler"

# Instalando o Git
- https://git-scm.com/download/win

# Instalar uso do projeto
01. no terminal "bundler install" na pasta do respectivo projeto
Projeto API
02. rodar o comando "cucumber -t @post"
Projeto_web - nova aba
03. rodar o comando "cucumber -t @nova_aba versao=/windows BROWSER=chrome"
Projeto_web - checkbox
03. rodar o comando "cucumber -t @checkbox versao=/dynamic_controls BROWSER=chrome"