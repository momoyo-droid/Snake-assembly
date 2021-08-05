# snake-assembly
<html>
  <body>
    <div align = "justify">
      [GRAD] Jogo Snake e implementação de nova instrução para o simulador Simple_Simulator feito para a disciplina de Prática em Organização de Computadores.
    </div>
  </body>
</html>

# Sobre o jogo
<html>
  <body>
    <div align = "justify">
      O  “jogo da cobrinha”, conhecido também como Snake, surgiu em 1976 nos fliperamas das cidades e logo se popularizou nos celulares da Nokia. O jogador controla uma longa e fina criatura que se arrasta pela tela, coletando comida, não podendo colidir com seu próprio corpo ou as "paredes" que cercam o jogador. Cada vez que a serpente come um pedaço de comida, sua cauda cresce, aumentando a dificuldade do jogo. O usuário controla a direção da cabeça da serpente (para cima, para baixo, esquerda e direita).
    </div>
  </body>
</html>

# Controles e Execução
<html>
  <body>
    <div align = "justify">
      Para a execução do jogo, é necessário ter os arquivos: 'sim', 'snake.mif' e 'charmap.mif'.<br>
Em seu terminal, dentro da pasta onde se localizam estes arquivos, digite:</br>
### ./sim snake.mif charmap.mif 
<br>
Para controlar a cobrinha, basta utilizar as teclas 'W', 'A', 'S' e 'D' do teclado.
    </div>
  </body>
</html>

# Vídeo de Apresentação 
- Link: <a href="url">Jogo Snake em Assembly</a>

# Implementação da nova instrução no Simple_Simulator
<html>
  <body>
    <div align = "justify">
      Desenvolvemos uma nova instrução que calcula a média entre os valores presentes em dois registradores e armazena o resultado em um terceiro registrador.<br>
      Para isso, modificamos a biblioteca **defs.h**, na qual é responsável por guardar as definições de cada instrução utilizada tanto no montador quanto no simulador.<br>
      Além disso, alteramos o **simple_simulator_template.c**, que contém os algoritmos de cada uma das instruções, para que possa receber através do **montador.c** os endereços de cada registrador utilizado na operação do código.
    </div>
  </body>
</html>
  
# Execução da instrução
Para a execução da instrução, é necessário ter os arquivos: 'simulador' e 'cpuram.mif'.<br>
Em seu terminal, dentro da pasta onde se localizam estes arquivos, digite: <br>
### ./simulador

# Agradecemos a atenção!
Ana Cristina Silva de Oliveira<br>
Gustavo Lelli Guirao<br>
Gustavo de Oliveira Silva
