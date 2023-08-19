from dataclasses import dataclass

@dataclass
class Pais:
  nome: str
  ouro: int
  prata: int
  bronze: int

def criar_pais(nome, ouro, prata, bronze):
    return Pais(nome, int(ouro), int(prata), int(bronze))

def conversor_de_nome(nome):
   return "".join([chr(ord('z') - (ord(letra) - ord('a'))) for letra in nome.lower()])
   
[print(f"{pais.nome} {pais.ouro} {pais.prata} {pais.bronze}") for pais in sorted([criar_pais(*input().split()) for i in range(int(input()))], key=lambda pais: (pais.ouro, pais.prata, pais.bronze, conversor_de_nome(pais.nome)), reverse=True)]
