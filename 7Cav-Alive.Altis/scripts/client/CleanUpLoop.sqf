//base cleanup loop
[] spawn {
  while true do {
      [] call CLIENT_BaseCleanup; //base cleanup
      sleep 300; //run every 5 minutes
    };
};