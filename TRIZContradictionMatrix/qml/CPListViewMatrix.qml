import QtQuick 2.0

ListView {
    clip: true


    model: opt.ds ? ds_model : md.eng
    delegate: CPLabel {
        title_no: (opt.ds ? number : (model.modelData.id + 1)) + ". "
        title_ko: opt.ds ? name : model.modelData.name
        contents: opt.ds ? content : model.modelData.desc1
    }


    ListModel {
                    id: ds_model
                    ListElement {
                        name: "Bill Smith"
                        number: "0"
                        content: "conttetwetpwfjpwefpojwepofjw234234pojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojef555"
                        text: "AAA"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "1"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "BBB"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "2"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "CCC"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "3"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "DDD"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "4"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "EEE"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "5"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                        text: "FFF"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "6"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "7"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "8"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "9"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "10"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "11"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "12"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "13"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "14"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "15"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "16"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "17"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "18"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "19"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "20"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Bill Smith"
                        number: "21"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "John Brown"
                        number: "22"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                    ListElement {
                        name: "Sam Wise"
                        number: "23"
                        content: "conttetwetpwfjpwefpojwepofjwpojef"
                    }
                }
}
