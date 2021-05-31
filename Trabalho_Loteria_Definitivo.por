programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
          cadeia loteria
          inteiro dezenas
          inteiro mega_sena[15]
          inteiro numero_sorteado
          inteiro jogos
	
		escreva(" Qual tipo de loteira você quer apostar?.( mega sena, quina, loto facil ou loto mania ) \n")
          leia(loteria)
          
		se (loteria == "mega sena") {

			real valorMega[] = {4.50, 31.50, 126.00, 378.00, 945.00, 2079.00, 4158.00, 7722.00, 13513.50, 22522.50}
      
               escreva(" Quantas dezenas você deseja?. obs:responda apenas com numeros. \n ")
               leia(dezenas)
               
               se(dezenas < 6 ou dezenas >15){
               escreva(" você só pode escolher entre 6 e 15 dezenas ")
               }

               senao{
               escreva(" Quantos jogos você quer fazer?\n ")
               leia(jogos)
               escreva("\n *********** \n")
            
               para(inteiro j=0; j < jogos; j++){

               estaRepetido(mega_sena,dezenas, 1, 60)             
               exibaLista(mega_sena)
               sorteiaDezenas(mega_sena, dezenas, 1, 60) 
               escreva("\n *********** \n")
               }
               inteiro posicao = dezenas - 6
               escreva("\n O valor de sua aposta é de R$", (valorMega[posicao] * jogos))
               }
            }   
		
		
	     se (loteria == "quina") {
			
               inteiro quina[15]
               real valorQuina[] = {2.00, 12.00, 42.00, 112.00, 252.00, 504.00, 924.00, 1584.00, 2574.00, 4004.00, 6006.00}
               
               escreva(" Quantas dezenas você deseja?. obs:responda apenas com numeros. \n ")
               leia(dezenas)

               se(dezenas < 5 ou dezenas >15){
               escreva(" você só pode escolher entre 5 e 15 dezenas ")
               }

               senao{
               
               escreva(" Quantos jogos você quer fazer?\n ")
               leia(jogos)
                escreva("\n *********** \n") 
                
               para(inteiro j=0; j < jogos; j++){
               	
               estaRepetido(quina,dezenas, 1, 80)
               
               exibaLista(quina)
               sorteiaDezenas(quina, dezenas, 1, 80)
               escreva("\n *********** \n")
               }
               inteiro posicao = dezenas - 5
               escreva("\n O valor de sua aposta é de R$", (valorQuina[posicao] * jogos))
               }
		}

          se (loteria == "loto facil") {

			inteiro loto_facil[20]
			real valorLotoF[] = {2.50, 40.00, 340.00, 2040.00, 9690.00, 38760.00}
      
               escreva(" Quantas dezenas você deseja?. obs:responda apenas com numeros. \n ")
               leia(dezenas)
               
               se(dezenas < 15 ou dezenas >20){
               escreva(" você só pode escolher entre 15 e 25 dezenas ")
               }

               senao{
               
               escreva(" Quantos jogos você quer fazer?\n ")
               leia(jogos)
               escreva("\n *********** \n")  

               
               para(inteiro j=0; j < jogos; j++){

               estaRepetido(loto_facil,dezenas, 1, 80)
               
               exibaLista(loto_facil)
               sorteiaDezenas(loto_facil, dezenas, 1, 25)
                escreva("\n *********** \n")
               }
               inteiro posicao = dezenas - 15
               escreva("\n O valor de sua aposta é de R$", (valorLotoF[posicao] * jogos))
               
               }
		}

		se (loteria == "loto mania") {
			
               inteiro loto_mania[50]
               
               escreva(" Quantas dezenas você deseja?. obs:responda apenas com numeros. \n ")
               leia(dezenas)

               se(dezenas < 50 ou dezenas >50){
               escreva(" você só pode escolher entre 6 e 15 dezenas ")
               }

               senao{
               real valorLotoM = 2.50
               escreva(" Quantos jogos você quer fazer?\n ")
               leia(jogos)
               escreva("\n *********** \n") 
               
               para(inteiro j=0; j < jogos; j++){
		
               estaRepetido(loto_mania,dezenas, 1, 80)
               
               
               exibaLista(loto_mania)
               sorteiaDezenas(loto_mania, dezenas, 1, 99)
                escreva("\n *********** \n")
               }
               escreva("\n O valor de sua aposta deu R$", valorLotoM * jogos)
               }
		}

	 
	}      //fim função inicio

      funcao organizaLista(inteiro lista[])
      {
      	inteiro tamanho = contaElementos(lista)
      	
          //ORDENAR
		inteiro auxiliar
		para(inteiro i=0; i < tamanho; i++){

			para(inteiro j = i + 1; j < tamanho; j++){

				se(lista[i] > lista[j]){
					auxiliar = lista[i]
					lista[i] = lista[j]
					lista[j] = auxiliar
				}
			}
		}
	
     }           //fim função organizar lista

      funcao exibaLista(inteiro lista[])
      {
      	inteiro tamanho = contaElementos(lista)
      	//exibe a lista de numeros sorteados
		para(inteiro i=0; i <  tamanho; i++){
			escreva(lista[i], " ")
			
		}
      	
      }

	funcao inteiro contaElementos(inteiro lista[])
	{
		inteiro tamanhoReal = 0
		inteiro tamanho = u.numero_elementos(lista)


		para(inteiro i=0; i <  tamanho; i++)
		{
			se (lista[i] != 0){ 

				tamanhoReal++
		     }
			
		}

		retorne tamanhoReal
		
	}

	funcao sorteiaDezenas(inteiro lista[], inteiro dezenas, inteiro min, inteiro max)
	{

     inteiro numero_sorteado
     
     para(inteiro i=0; i < dezenas; i++){
     	numero_sorteado = u.sorteia(min, max)
     	lista[i] = numero_sorteado

		}
		
     }

      funcao estaRepetido(inteiro numeros[],inteiro tamanho, inteiro min, inteiro max)
      {
      inteiro numero_sorteado
      logico esta_repetido = falso

      para(inteiro i=0; i < tamanho; i++){

      faca{
      	esta_repetido = falso
      	numero_sorteado = u.sorteia(min, max)

      	para(inteiro c=0; c < tamanho; c++){
            se(numero_sorteado == numeros[c]){
            	esta_repetido = verdadeiro
            }
		}
      }enquanto(esta_repetido == verdadeiro)
       numeros[i] = numero_sorteado
		}
      	organizaLista(numeros)
      	
      }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4481; 
 * @DOBRAMENTO-CODIGO = [141, 161, 172, 191, 204];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */