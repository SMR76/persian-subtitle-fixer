#ifndef REGISTRYHANDLER_H
#define REGISTRYHANDLER_H

/*
 *
 *
 *
 *
 *
 */

#include <QObject>
#include <QQuickItem>

#include <stdlib.h>

#ifdef WIN32
    #include <windows.h>
    #include <winreg.h>
#endif

class settingAPI : public QQuickItem
{
    Q_OBJECT
public:
    settingAPI();

    bool createRegKey()
    {
#ifdef WIN32
        PHKEY  pointerKey = nullptr;
        long errorCode = RegOpenKeyExA(HKEY_CURRENT_USER,nullptr,NULL,KEY_ALL_ACCESS,pointerKey);

        if(ERROR_SUCCESS == errorCode)
            return true;
#endif
        return false;
    }

signals:

public slots:
};

#endif // REGISTRYHANDLER_H
