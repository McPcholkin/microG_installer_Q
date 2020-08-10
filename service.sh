

# Wait for boot to complete
sleep 20
until [ "$(getprop sys.boot_completed)" ]
  do
    sleep 2
  done

# If ACCESS_FINE_LOCATION not granted yet run fix, else skip
if [ "$(exec dumpsys package com.google.android.gms | grep ACCESS_FINE_LOCATION | grep granted=false)" ]
  then
    su -c exec pm grant com.google.android.gms android.permission.ACCESS_FINE_LOCATION
fi

# If ACCESS_BACKGROUND_LOCATION not granted yet run fix, else skip
if [ "$(exec dumpsys package com.google.android.gms | grep ACCESS_BACKGROUND_LOCATION | grep granted=false)" ]
  then
    su -c exec pm grant com.google.android.gms android.permission.ACCESS_BACKGROUND_LOCATION
fi


# If ACCESS_COARSE_LOCATION not granted yet run fix, else skip
if [ "$(exec dumpsys package com.google.android.gms | grep ACCESS_COARSE_LOCATION | grep granted=false)" ]
  then
    su -c exec pm grant com.google.android.gms android.permission.ACCESS_COARSE_LOCATION
fi

# If FAKE_PACKAGE_SIGNATURE not granted yet run fix, else skip
if [ "$(exec dumpsys package com.android.vending | grep FAKE_PACKAGE_SIGNATURE | grep granted=false)" ]
  then
    su -c exec pm grant com.android.vending android.permission.FAKE_PACKAGE_SIGNATURE
fi
