
# Classe abstrata
class Animal:

    __populacao = 0

    @staticmethod
    def obter_populacao():
        return Animal.__populacao

    def __init__(self, nome):
        self._nome = nome
        Animal.__populacao += 1

    def obter_nome(self):
        return self._nome
    
    def definir_nome(self, novo_nome):
        self._nome = novo_nome

    # Método que será sobreescrito por cada classe concreta
    def fazer_som(self): ...


# Classe concreta que herda de Animal
class Gato(Animal):

    def __init__(self, nome):
        super().__init__(nome)
     
    def fazer_som(self):
        print(f"{self.obter_nome()}: Miau")


# Classe concreta que herda de Animal
class Cachorro(Animal):

    def __init__(self, nome):
        super().__init__(nome)

    def fazer_som(self):
        print(f"{self.obter_nome()}: Auau")


class Roupa:

    def __init__(self, nome, tamanho, preco):
        self.__nome = nome
        self.__tamanho = tamanho
        self.__preco = preco

    def obter_nome(self):
        return self.__nome
    
    def definir_nome(self, novo_nome):
        self.__nome = novo_nome

    def obter_tamanho(self):
        return self.__tamanho
    
    def definir_tamanho(self, novo_tamanho):
        self.__tamanho = novo_tamanho

    def obter_preco(self):
        return self.__preco
    
    def definir_preco(self, novo_preco):
        self.__preco = novo_preco

# Classe concreta que herda de Animal
class Humano(Animal):

    def __init__(self, nome, roupa, pensamento=""):
        super().__init__(nome)
        self.__pensamento = pensamento

        # Aqui está uma caracteristica composta e não herdada
        self.__roupa_atual = roupa

    def obter_pensamento(self):
        return self.__pensamento
    
    def definir_pensamento(self, novo_pensamento):
        self.__pensamento = novo_pensamento

    def obter_roupa_atual(self):
        return self.__roupa_atual
    
    def definir_roupa_atual(self, nova_roupa_atual):
        self.__roupa_atual = nova_roupa_atual

    def fazer_som(self):
        print(f"{self.obter_nome()} (vestindo {self.obter_roupa_atual().obter_nome()}): {self.__pensamento}")


# Criando (instanciando) um objeto Gato
meu_gato = Gato("Luna")
meu_gato.fazer_som()

# Criando (instanciando) um objeto Cachorro
meu_cachorro = Cachorro("Polly")
meu_cachorro.fazer_som()

# Criando (instanciando) um objeto Humano
eu = Humano("Augusto", Roupa("Pijama", "M", 100.0), "Penso, logo existo!")
eu.fazer_som()

# Resgatando a população atual de animais com um método estático
print(Animal.obter_populacao())

