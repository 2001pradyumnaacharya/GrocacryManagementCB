import sys
from pathlib import Path
from PySide6.QtCore import QObject, Signal, Slot, QUrl
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import loginManagementModule as authBackend

class Backend(QObject):

    signal = Signal()
    def __init__(self, engine):
        super().__init__()
        self.engine = engine



    @Slot(str, str, result=bool)
    def loginManager(self, username, password):
        result = authBackend.login(username, password)
        if result:
            self.signal.emit()
            return True
        else:
            return False



    @Slot(str,str,str,result=bool)
    def registerManager(self,username,password,conformPassword):
        registerResult=authBackend.register(username,password,conformPassword)
        if registerResult:
            self.signal.emit()
            return True
        else:
            return False



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    backend = Backend(engine)
    engine.rootContext().setContextProperty("backend", backend)


    qml_file = Path(__file__).resolve().parent / "main.qml"
    engine.load(QUrl.fromLocalFile(qml_file))

    if not engine.rootObjects():
        sys.exit(-1)


    sys.exit(app.exec())
