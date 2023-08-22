## Getting Started 🚀

If you are running the project for the first time and you do not have anything installed to work with flutter, you need to run this command:

# Build

Flutter version: 3.13.0

P.S. make sure you have **xcode** and **android studio** installed

```sh
make bootstrap
```

P.S. this script only for mac

# Development

This command need for update all generated files:

```sh
make gen-force
```

For cleaning all dependencies, you can call the command:

```sh
make clean
```

Use the following commands to run the project:

```sh
fvm flutter pub upgrade
make gen-force
fvm flutter run --release
```

If you are working through VSCode, you can run the project through the schema, but before that, do not forget to run the commands:

```sh
fvm flutter pub upgrade
make gen-force
```

# Project information

## Theme

To work with color or styles, you must use **context**:

``` dart
context.colors.white;

context.themeData.header1.black;
```

Information with styles is stored in the directory **/common/theme**


## DI

To work with DI, injection is used. Job descriptions can be found **/common/injection**

If you need to create a singleton object, then you need to add the **@singleton** prefix above the class for all other cases of **@injection**

## Navigation

The go_router package is used for navigation. The description of all routes is described in the general file in the directory **/common/router**