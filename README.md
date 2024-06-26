# HP-41CY Initialization ROM

This is my attempt to re-initialize a corrupted HP-41CY calculator. If you
are not familiar with this device, this project is most probably not for you.
Otherwise, please note:

*THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, FOR EDUCATIONAL
AND NON-COMMERCIAL USE ONLY. USE IT AT YOUR OWN RISK.*

Furthermore, I can only provide limited support as I have a
life besides HP calculators :-)

## Project Organization
If you want to build the ROM images by yourself, please note that the build
process is based on my
[MCODE project setup](https://github.com/blanknut/mcode-project-osx)
for macOS. I don't want to repeat the details here.

Unless you don't intend to change the sources, you can just use the ROM images
in subfolder `./rom`.

## Usage

### Prerequisites
For the re-initialization process you'll need a
[CLONIX module](http://www.clonix41.org/)
and an appropriate programmer.

### CLONIX Configuration
Program a CLONIX module using the following configuration:

| Page | Content                             |
| ---- | ----------------------------------- |
| #4   | rb2ini-4.rom                        |
| #8   | Any 4K ROM, e.g., Math              |
| #9   | *must be empty*                     |
| #A   | *must be empty*                     |
| #B   | rb2ini-b.rom                        |
| #C   | Any 4K ROM, e.g., David Assembler   |
| #D   | empty (due to CLONIX limitation)    |
| #E   | Rambx64a.rom (HP-41CY OS/A)         |
| #F   | Rambx64b.rom (HP-41CY OS/B)         |

### Re-initialization Procedure
Prepare your HP-41CY for re-initialization:
* Turn off TURBO mode.
* Make sure that the OS write protection DIP switch is set to _Unprotect_.
  You'll find this switch in the battery compartment, see picture below.
* Remove all modules.
* Insert the CLONIX into any port.

![DIP](./images/wwrbprotect.png "OS write protection DIP switch")

Before continuing please note that the whole RAMBOX will be cleared!
However, this shouldn't be a problem if your HP-41CY is really corrupted.

Now it's time to turn on your HP-41CY. The re-initialization program starts
automatically and shows the following progress:

> &#50883;&#10033;&#10033;/a9BCDEF/-bABCDEF-

If not:
* your HP-41CY might be in a state which is not properly handled by this
  re-initialization module (sorry), or
* there is a hardware problem (ouch).

If you encounter any issues please drop me a note. Maybe it helps to improve
this module. Of course, any comments or suggestions are welcome.

## Testing
For testing purposes I also wrote a HP-41CY Eraser module, see subfolder
`./rb2del`. This is a take-over ROM, too. When plugged into a HP-41CY it
runs automatically after a power-on and overwrites both banks of the RAMBOX,
including the operating system (if not write protected). Usually, this causes
a severe crash and the calculator goes crazy on the next power-on.

## Implementation Notes
Please refer to the document
[HP-41CY Technical Information]( ./doc/hp41cy-techinfo.pdf)
for details about the re-initialization process and some of my findings about
the HP-41CY.

## References
You might also be interested in my
[W&W 32K RAMBOX Initialization ROM](https://github.com/blanknut/rbini).

I guess you already know the following web sites:
* [The HP-41 Archive](http://hp41.org/) web site contains _a lot_ of interesting
  information about the HP-41 calculator.
* If you have any questions about HP calculators have a look at the forum on
  [The Museum of HP Calculators](http://hpmuseum.org/). There are many friendly
  HP calculator enthusiasts that are willing to share their knowledge and
  experience.
* The [CLONIX](http://www.clonix41.org) module is one of the best add-ons you can
  buy for your Series 41 calculator and worth every penny.


