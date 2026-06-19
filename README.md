##
<h1 align="center">Linux·Renascentia</h1>

 ## SWAY Theme (PT-BR | EN | ES)

---
![Preview](logo.png)


## Screenshots

![Preview](captura/home.png)

2.0

![Preview](captura/2.01.png)

![Preview](captura/desb.jpg)

![Preview](captura/bloq.jpg)



# Atenção - Attention



![Preview](captura/at.png)


![Preview](captura/bateria.jpg)

![Preview](captura/at3.jpg)


![Preview](captura/at2.png)

2.0

![Preview](captura/2At.jpg)
---

## GTK3

![Preview](captura/gtk.png)
![Preview](captura/gtk2.png)
![Preview](captura/gtk3.png)


---

## Rofi

![Preview](captura/rofi.png)
![Preview](captura/desl.png)

ROFI 2.0

![Preview](captura/rof20.png)

---

## Dunst

![Preview](captura/dust.png)
![Preview](captura/dust2.png)

---

## SDDM — A Primavera

![Preview](captura/p1.png)
![Preview](captura/p2.png)

---

## SDDM — O Nascimento de Vênus

![Preview](captura/v1.png)
![Preview](captura/v2.png)

---
## Firefox GTK
![Preview](captura/figtk.png)
![Preview](captura/fgtk2.png)
![Preview](captura/fgtk3.png)


# Firefox theme
![Preview](captura/ft.png)
![Preview](captura/ft2.png)

https://addons.mozilla.org/firefox/addon/linux-renascentia/



---
##Português (Brasil)


# 🎨 Linux-Renascentia

> Um tema para Sway onde o minimalismo contemporâneo encontra a sofisticação do Renascimento.



---

## 📖 Origem e Descrição

A ideia inicial era criar um tema moderno e funcional para o Sway. Porém, durante os testes, algo inesperado aconteceu: as combinações de cores — verde escuro, cobre e ouro — e a atmosfera do tema começaram a remeter ao período renascentista, tons clássicos, sóbrios e elegantes, como uma pintura da época.

O que era para ser apenas "moderno" acabou ganhando uma identidade própria: um tema que une o minimalismo contemporâneo com a sofisticação visual do Renascimento.

A conexão se tornou ainda mais forte ao encontrar na obra *A Primavera*, de Sandro Botticelli, o wallpaper perfeito. As cores da pintura casaram naturalmente com a paleta, e ela foi adotada como papel de parede padrão do tema.

O resultado é um ambiente imersivo, com cores quentes e equilibradas, pensado para quem passa longas horas no computador e aprecia uma interface bonita e funcional — agora com alma renascentista.

---

## 🎨 Paleta de Cores

| Cor          | Uso                         |
|--------------|-----------------------------|
| Verde escuro | Backgrounds e superfícies   |
| Cobre        | Detalhes e elementos sutis  |
| Ouro         | Destaques, bordas e foco    |

---

## 🧩 Componentes Incluídos

-  **Sway** — tema principal do gerenciador de janelas
-  **Waybar** — barra de status com cores calibradas para o wallpaper *A Primavera*
-  **GTK3** — tema para aplicações (construído de forma experimental, pode conter inconsistências)
-  **Dunst** — notificações do sistema estilizadas
-  **Swaylock** — tela de bloqueio personalizada
-  **SDDM** — duas opções de tema:
  - Principal: *A Primavera* (Botticelli)
  - Alternativo: *O Nascimento de Vênus* (Botticelli)
-  **Foot** — tema para o terminal
-  **Rofi** — menus e lançadores

---

## 📦 Instalação

### 1. Fazer backup (recomendado)

Antes de instalar, faça backup das suas configurações atuais caso queira preservar algo:

```bash
cp -r ~/.config/dunst ~/backup/
cp -r ~/.config/foot ~/backup/
cp -r ~/.config/rofi ~/backup/
cp -r ~/.config/sway ~/backup/
cp -r ~/.config/swaylock ~/backup/
cp -r ~/.config/waybar ~/backup/
```

### 2. Baixe o repositório


https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.tar.gz

https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.zip

```bash

cd Linux-Renascentia
```
Ou

```bash
git clone https://github.com/DionatanFelipe/linuxrenascentia.git
cd Linux-Renascentia
```



### 3. Instalar as configurações do Sway

Copie as pastas para `~/.config/`:

```bash
cp -r Linux-Renascentia/config/dunst ~/.config/
cp -r Linux-Renascentia/config/foot ~/.config/
cp -r Linux-Renascentia/config/rofi ~/.config/
cp -r Linux-Renascentia/config/sway ~/.config/
cp -r Linux-Renascentia/config/swaylock ~/.config/
cp -r Linux-Renascentia/config/waybar ~/.config/
```

### 4. Instalar o tema GTK3

```bash
cp -r Linux-Renascentia/themes/Linux-Renascentia ~/.themes/
```

### 5. Instalar os wallpapers

Copie a pasta `img` para sua home (ou para o caminho que preferir):

```bash
cp -r Linux-Renascentia/img ~/
```

> ⚠️ Caso escolha outro local, ajuste o caminho do wallpaper no arquivo `~/.config/sway/config`.

### 6. Instalar o tema SDDM

A pasta `sddm/IDIOMA/` contém os dois temas:

| Pasta                   | Tema                        |
|-------------------------|-----------------------------|
| `Linux-Renascentia`     | *O Nascimento de Vênus*     |
| `Linux-Renascentia2`    | *A Primavera* (padrão)      |

Cada tema está disponível em três idiomas: **pt-br**, **en** e **es**.

Escolha o idioma e o tema desejado, depois copie para o diretório do SDDM:

```bash
# Exemplo: tema padrão (A Primavera) em português
sudo cp -r Linux-Renascentia/sddm/pt-br/Linux-Renascentia2 /usr/share/sddm/themes/
```

Depois, edite o arquivo de configuração do SDDM (`/etc/sddm.conf`) e defina:

```ini
[Theme]
Current=Linux-Renascentia2
```

### 7. Instalar temas do Foot e Rofi no sistema (opcional)

Caso prefira que os temas fiquem disponíveis globalmente:

**Foot:**
```bash
sudo cp -r Linux-Renascentia/usr/share/foot/themes/* /usr/share/foot/themes/
```

**Rofi:**
```bash
sudo cp -r Linux-Renascentia/usr/share/rofi/themes/* /usr/share/rofi/themes/
```

**Ícones:**
```bash
sudo cp -r Linux-Renascentia/usr/share/icons/* /usr/share/icons/
```

### 8. Recarregar o Sway

Pressione `Mod+Shift+C` para recarregar o Sway e aplicar todas as mudanças.

Pronto! O Linux-Renascentia está instalado. 🎨

---
Tema para firefox:
https://addons.mozilla.org/firefox/addon/linux-renascentia/

## ⚠️ Observações Importantes

Caso queira que não fique em alguns casos ... no waybar onde é o  layout do teclado( mesmo após no terminal  `sudo usermod -aG input $USER`) em alguns programas, é necessário mudar a fonte no config do waybar, uso a inter. 


Para ativar o gtk no firefox caso não aparece ou esteja com preferencias modo claro, no firefox  vá em `about:config` e crie:
```
ui.systemUsesDarkTheme
```

e adicione = :
```
1
```



- O tema **GTK3** foi feito sem conhecimento aprofundado. Bugs e inconsistências visuais podem ocorrer — sinta-se livre para reportar ou corrigir.
- As cores da **Waybar** foram pensadas para o wallpaper padrão (*A Primavera*). Ao trocar o papel de parede, talvez seja necessário ajustar transparência ou tons manualmente no arquivo de configuração.
- Para uma experiência completa, recomenda-se usar os wallpapers incluídos com o tema SDDM correspondente.

---

##  Contribuições

Contribuições são muito bem-vindas! Sinta-se à vontade para:

- Corrigir o tema GTK3

---

## 📝 Licença

Este projeto está sob a licença MIT.

---

<p align="center">
  <b>🌟 Feito com 💜 inspirado no Renascimento</b>
</p>

---

## English

---

# 🎨 Linux-Renascentia

> A Sway theme where contemporary minimalism meets Renaissance sophistication.



---

## 📖 Origin & Description

The initial idea was to create a modern and functional theme for Sway. However, during testing, something unexpected happened: the color combinations — dark green, copper, and gold — and the atmosphere of the theme began to evoke the Renaissance period, classic, sober, and elegant tones, like a painting from that era.

What was meant to be just "modern" ended up gaining its own identity: a theme that blends contemporary minimalism with the visual sophistication of the Renaissance.

The connection became even stronger when we found in Sandro Botticelli's *Primavera* the perfect wallpaper. The painting's colors naturally matched the palette, and it was adopted as the theme's default wallpaper.

The result is an immersive environment, with warm and balanced colors, designed for those who spend long hours at the computer and appreciate a beautiful and functional interface — now with a Renaissance soul.

---

## 🎨 Color Palette

| Color      | Usage                       |
|------------|-----------------------------|
| Dark Green | Backgrounds and surfaces    |
| Copper     | Details and subtle elements |
| Gold       | Highlights, borders, focus  |

---

## 🧩 Included Components

-  **Sway** — main window manager theme
-  **Waybar** — status bar with colors calibrated for the *Primavera* wallpaper
-  **GTK3** — application theme (built experimentally, may contain inconsistencies)
-  **Dunst** — styled system notifications
-  **Swaylock** — customized lock screen
-  **SDDM** — two theme options:
  - Primary: *Primavera* (Botticelli)
  - Alternative: *The Birth of Venus* (Botticelli)
-  **Foot** — terminal theme
-  **Rofi** — menus and launchers

---

## 📦 Installation

### 1. Backup (recommended)

Before installing, backup your current configurations if you want to preserve anything:

```bash
cp -r ~/.config/dunst ~/backup/
cp -r ~/.config/foot ~/backup/
cp -r ~/.config/rofi ~/backup/
cp -r ~/.config/sway ~/backup/
cp -r ~/.config/swaylock ~/backup/
cp -r ~/.config/waybar ~/backup/
```

### 2. Download the repository

https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.tar.gz

https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.zip
```bash

cd Linux-Renascentia
```
or
```bash
git clone https://github.com/DionatanFelipe/linuxrenascentia.git
cd Linux-Renascentia
```


### 3. Install Sway configurations

Copy the folders to `~/.config/`:

```bash
cp -r Linux-Renascentia/config/dunst ~/.config/
cp -r Linux-Renascentia/config/foot ~/.config/
cp -r Linux-Renascentia/config/rofi ~/.config/
cp -r Linux-Renascentia/config/sway ~/.config/
cp -r Linux-Renascentia/config/swaylock ~/.config/
cp -r Linux-Renascentia/config/waybar ~/.config/
```

### 4. Install GTK3 theme

```bash
cp -r Linux-Renascentia/themes/Linux-Renascentia ~/.themes/
```

### 5. Install wallpapers

Copy the `img` folder to your home directory (or to your preferred path):

```bash
cp -r Linux-Renascentia/img ~/
```

> ⚠️ If you choose another location, adjust the wallpaper path in `~/.config/sway/config`.

### 6. Install SDDM theme

The `sddm/LANGUAGE/` folder contains both themes:

| Folder                   | Theme                      |
|--------------------------|----------------------------|
| `Linux-Renascentia`      | *The Birth of Venus*       |
| `Linux-Renascentia2`     | *Primavera* (default)      |

Each theme is available in three languages: **pt-br**, **en**, and **es**.

Choose the language and desired theme, then copy to the SDDM directory:

```bash
# Example: default theme (Primavera) in English
sudo cp -r Linux-Renascentia/sddm/en/Linux-Renascentia2 /usr/share/sddm/themes/
```

Then edit the SDDM configuration file (`/etc/sddm.conf`) and set:

```ini
[Theme]
Current=Linux-Renascentia2
```

### 7. Install Foot and Rofi themes system-wide (optional)

If you prefer the themes to be available globally:

**Foot:**
```bash
sudo cp -r Linux-Renascentia/usr/share/foot/themes/* /usr/share/foot/themes/
```

**Rofi:**
```bash
sudo cp -r Linux-Renascentia/usr/share/rofi/themes/* /usr/share/rofi/themes/
```

**Icons:**
```bash
sudo cp -r Linux-Renascentia/usr/share/icons/* /usr/share/icons/
```

### 8. Reload Sway

Press `Mod+Shift+C` to reload Sway and apply all changes.

Done! Linux-Renascentia is installed. 

Firefox theme:
https://addons.mozilla.org/firefox/addon/linux-renascentia/

---

## ⚠️ Important Notes

If you want certain things not to appear in some cases, for example in the Waybar keyboard layout module (even after running `sudo usermod -aG input $USER` in the terminal), in some programs it may be necessary to change the font in the Waybar config. I use Inter.

To enable GTK theming in Firefox when it does not appear correctly or is stuck in light mode, go to `about:config` in Firefox and create the preference:

```
ui.systemUsesDarkTheme
```

and set it to:

```
1
```


- The **GTK3** theme was made without deep knowledge. Bugs and visual inconsistencies may occur — feel free to report or fix them.
- **Waybar** colors were designed for the default wallpaper (*Primavera*). When changing the wallpaper, you may need to manually adjust transparency or tones in the configuration file.
- For a complete experience, we recommend using the wallpapers included with the corresponding SDDM theme.

---

##  Contributions

Contributions are very welcome! Feel free to:

- Fix the GTK3 theme (help! )

---


---

## Español

---

# 🎨 Linux-Renascentia

> Un tema para Sway donde el minimalismo contemporáneo encuentra la sofisticación del Renacimiento.



---

## 📖 Origen y Descripción

La idea inicial era crear un tema moderno y funcional para Sway. Sin embargo, durante las pruebas, algo inesperado sucedió: las combinaciones de colores — verde oscuro, cobre y oro — y la atmósfera del tema comenzaron a evocar el período renacentista, tonos clásicos, sobrios y elegantes, como una pintura de la época.

Lo que iba a ser solo "moderno" terminó ganando una identidad propia: un tema que une el minimalismo contemporáneo con la sofisticación visual del Renacimiento.

La conexión se volvió aún más fuerte al encontrar en *La Primavera*, de Sandro Botticelli, el wallpaper perfecto. Los colores de la pintura combinaron naturalmente con la paleta, y fue adoptada como papel tapiz predeterminado del tema.

El resultado es un entorno inmersivo, con colores cálidos y equilibrados, pensado para quienes pasan largas horas frente al ordenador y aprecian una interfaz bonita y funcional — ahora con alma renacentista.

---

## 🎨 Paleta de Colores

| Color        | Uso                           |
|--------------|-------------------------------|
| Verde oscuro | Fondos y superficies          |
| Cobre        | Detalles y elementos sutiles  |
| Oro          | Destacados, bordes y foco     |

---

## 🧩 Componentes Incluidos

-  **Sway** — tema principal del gestor de ventanas
-  **Waybar** — barra de estado con colores calibrados para el wallpaper *La Primavera*
-  **GTK3** — tema para aplicaciones (construido de forma experimental, puede contener inconsistencias)
-  **Dunst** — notificaciones del sistema estilizadas
-  **Swaylock** — pantalla de bloqueo personalizada
-  **SDDM** — dos opciones de tema:
  - Principal: *La Primavera* (Botticelli)
  - Alternativo: *El Nacimiento de Venus* (Botticelli)
-  **Foot** — tema para el terminal
- **Rofi** — menús y lanzadores

---

## 📦 Instalación

### 1. Hacer backup (recomendado)

Antes de instalar, haz una copia de seguridad de tus configuraciones actuales si quieres conservar algo:

```bash
cp -r ~/.config/dunst ~/backup/
cp -r ~/.config/foot ~/backup/
cp -r ~/.config/rofi ~/backup/
cp -r ~/.config/sway ~/backup/
cp -r ~/.config/swaylock ~/backup/
cp -r ~/.config/waybar ~/backup/
```

### 2. Download el repositorio
https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.tar.gz

https://github.com/DionatanFelipe/linuxrenascentia/releases/download/Linux%2CTheme%2CSway/Linux-Renascentia.zip
```bash

cd Linux-Renascentia
```
o

```bash
git clone https://github.com/DionatanFelipe/linuxrenascentia.git

cd Linux-Renascentia
```

### 3. Instalar las configuraciones de Sway

Copia las carpetas a `~/.config/`:

```bash
cp -r Linux-Renascentia/config/dunst ~/.config/
cp -r Linux-Renascentia/config/foot ~/.config/
cp -r Linux-Renascentia/config/rofi ~/.config/
cp -r Linux-Renascentia/config/sway ~/.config/
cp -r Linux-Renascentia/config/swaylock ~/.config/
cp -r Linux-Renascentia/config/waybar ~/.config/
```

### 4. Instalar el tema GTK3

```bash
cp -r Linux-Renascentia/themes/Linux-Renascentia ~/.themes/
```

### 5. Instalar los wallpapers

Copia la carpeta `img` a tu home (o a la ruta que prefieras):

```bash
cp -r Linux-Renascentia/img ~/
```

> ⚠️ Si eliges otra ubicación, ajusta la ruta del wallpaper en el archivo `~/.config/sway/config`.

### 6. Instalar el tema SDDM

La carpeta `sddm/IDIOMA/` contiene los dos temas:

| Carpeta                  | Tema                          |
|--------------------------|-------------------------------|
| `Linux-Renascentia`      | *El Nacimiento de Venus*      |
| `Linux-Renascentia2`     | *La Primavera* (predeterminado) |

Cada tema está disponible en tres idiomas: **pt-br**, **en** y **es**.

Elige el idioma y el tema deseado, luego copia al directorio de SDDM:

```bash
# Ejemplo: tema predeterminado (La Primavera) en español
sudo cp -r Linux-Renascentia/sddm/es/Linux-Renascentia2 /usr/share/sddm/themes/
```

Luego edita el archivo de configuración de SDDM (`/etc/sddm.conf`) y define:

```ini
[Theme]
Current=Linux-Renascentia2
```

### 7. Instalar temas de Foot y Rofi en el sistema (opcional)

Si prefieres que los temas estén disponibles globalmente:

**Foot:**
```bash
sudo cp -r Linux-Renascentia/usr/share/foot/themes/* /usr/share/foot/themes/
```

**Rofi:**
```bash
sudo cp -r Linux-Renascentia/usr/share/rofi/themes/* /usr/share/rofi/themes/
```

**Iconos:**
```bash
sudo cp -r Linux-Renascentia/usr/share/icons/* /usr/share/icons/
```

### 8. Recargar Sway

Presiona `Mod+Shift+C` para recargar Sway y aplicar todos los cambios.

¡Listo! Linux-Renascentia está instalado. 

Thema a Firefox:
https://addons.mozilla.org/firefox/addon/linux-renascentia/

---

## ⚠️ Notas Importantes


Si quieres que algunas cosas no aparezcan en ciertos casos ..., por ejemplo en el módulo de distribución del teclado en Waybar (incluso después de ejecutar `sudo usermod -aG input $USER` en la terminal), en algunos programas puede ser necesario cambiar la fuente en la configuración de Waybar. Yo uso Inter.

Para activar el tema GTK en Firefox cuando no aparece o está en modo claro, ve a `about:config` en Firefox y crea la preferencia:

```
ui.systemUsesDarkTheme
```

y configúrala en:

```
1
```


- El tema **GTK3** fue hecho sin conocimiento profundo. Pueden ocurrir bugs e inconsistencias visuales — siéntete libre de reportarlos o corregirlos.
- Los colores de **Waybar** fueron pensados para el wallpaper predeterminado (*La Primavera*). Al cambiar el papel tapiz, puede ser necesario ajustar transparencia o tonos manualmente en el archivo de configuración.
- Para una experiencia completa, se recomienda usar los wallpapers incluidos con el tema SDDM correspondiente.

---

##  Contribuciones

¡Las contribuciones son muy bienvenidas! Siéntete libre de:

- Corregir el tema GTK3 (¡ayuda!)

---
