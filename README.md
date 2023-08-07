## Previsão do Tempo - Aplicação Flutter

Este é um projeto de aplicativo móvel para previsão do tempo. O aplicativo consome uma API
externa (https://openweathermap.org/api/one-call-3), utilizando as coordenadas de latitude e
longitude do dispositivo, para fornecer informações precisas sobre a previsão do tempo.

### Funcionalidades

- Exibição da previsão do tempo atual com informações sobre temperatura máxima e mínima, velocidade
  do vento e umidade.
- Nome da cidade retornado pela API e data/hora atuais.
- A cada atualização dos dados da API de clima, busca uma imagem do local atual do usuário via API
  de imagens do Pexel (https://www.pexels.com/api/documentation/#photos-search),
  nem sempre vem uma imagem correta do local 😁 e caso não encontre utiliza uma padrão de BH.

### Pré-requisitos

Antes de executar o aplicativo, você precisará ter os seguintes itens instalados:

- Flutter SDK (versão 3.10.6) - Recomenda-se a instalação via FVM (https://fvm.app/)

### Instalação

1. Faça um clone deste repositório para o seu ambiente local.

```bash
git clone https://github.com/thiagoWeatherFrame/weather.git

cd weather

flutter pub get

flutter run
```

### Uso

Após a instalação, abra o aplicativo em seu emulador ou dispositivo físico. O aplicativo solicitará
permissão para acessar a localização, caso ainda não tenha sido concedida. Depois disso, ele exibirá
a previsão do tempo para sua localização atual.
