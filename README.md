# MCU Dashboard

## Flashing 

### Arduino Uno Board Target

```bash
avrdude -c atmelice_isp -p m328p -v -U flash:w:application.hex:i
```

### STM32 BluePill Board Target

```bash
openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg -c "program application.elf verify reset exit"
```

## Generating Documentation

The project description documentation can be generated with the `asciidoctor-pdf` tool.

```bash
asciidoctor-pdf docs/project-description.adoc
```

The generated PDF will be colocated with the `.adoc` file.
