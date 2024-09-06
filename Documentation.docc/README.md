#  Tabs

@TabNavigator {
    @Tab("English") {
        ![some descriptions 1](lion1)
    }

    @Tab("Chinese") {
        ![some descriptions 2](lion2)
    }

    @Tab("Spanish") {
        ![some descriptions 3](lion3)
    }
}

@Row {
    @Column(size: 2) {
        First, you customize your sloth by picking its 
        ``Sloth/power-swift.property``. The power of your sloth influences
        its abilities and how well they cope in their environment. The app
        displays a picker view that showcases the available powers and
        previews your sloth for the selected power.
    }

    @Column {
        ![bla bla bla](lion1)
    }
}

@Row {
    @Column {
        ![bla bla bla](lion2)
    }
    
    @Column(size: 2) {
        Once you've customized your sloth, it's ready to ready to thrive.
        You'll find that sloths will happily munch on a leaf, but may not be as 
        receptive to working out. Use the activity picker to send some
        encouragement.
    }
}
