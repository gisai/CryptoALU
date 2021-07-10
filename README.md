# CryptoALU

El proyecto se basa en el diseño, desarrollo e implementación de un circuito integrado reconfigurable para aplicaciones específicas (ASIC) basado en una arquitectura MIPS que sea capaz de realizar operaciones criptográficas, más concretamente, se va a implementar el algoritmo RSA para conseguir realizar tanto el cifrado como el descifrado de un determinado texto en claro. Se van a llevar a cabo cada una de las distintas etapas de desarrollo, codificación usando el llamado lenguaje de descripción hardware y, posteriormente, se va a realizar la implementación física usando una FPGA (Modelo Artix 7-Basys 3). En este punto, se va a usar el lenguaje VHDL y los entornos de desarrollo Vivado y ModelSim. Para lograr el objetivo de añadir las nuevas funcionalidades necesarias a la arquitectura clásica se van a usar diferentes técnicas y algoritmos de computación adquiridos en la escuela por los miembros del grupo.


## Código implementado

En este repositorio se puede encontrar la totalidad del código desarrollado. En la carpeta **Componentes_Ruta_Datos** se encuentra todos los componentes que conforman la ruta de datoa y en la carpeta **Simulaciones** se encuentran todas las pruebas de caja negra y caja blanca realizados a dichos componentes. Podemos encontrar desde componentes básicos como biestables o sumadores de un bit a el bloque final del proyecto.

## Software utilizado

Para llevar a cabo la realización dle proyecto se ha usado:

* [Vivado](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi50ajAg9nxAhWW3YUKHQ_DA3gQFnoECAUQAw&url=https%3A%2F%2Fwww.xilinx.com%2Fproducts%2Fdesign-tools%2Fvivado.html&usg=AOvVaw3CcDlFZ09ShLIwRCmt_Sm3) : para realizar la implementación de la ruta de datos y la síntesis en la placa FPGA.
* [Adept](https://store.digilentinc.com/digilent-adept/) : para realizar la carga de los archivos bitstream en la placa FPGA basys3
