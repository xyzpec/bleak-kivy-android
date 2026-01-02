#!/bin/bash
echo "=== WSL Network Test ==="
echo

# 1. Check DNS resolution
echo "1. DNS Resolution Test:"
nslookup google.com || echo "❌ DNS resolution failed"

# 2. Test internet connectivity
echo -e "\n2. Internet Connectivity Test:"
ping -c 2 8.8.8.8 || echo "❌ Ping failed"

# 3. Test HTTP connection
echo -e "\n3. HTTP Connection Test:"
curl -s --connect-timeout 5 https://www.google.com > /dev/null && echo "✅ HTTP connection OK" || echo "❌ HTTP connection failed"

# 4. Check resolv.conf
echo -e "\n4. DNS Configuration:"
cat /etc/resolv.conf 2>/dev/null || echo "❌ resolv.conf not found"

echo -e "\n=== Test Complete ==="
