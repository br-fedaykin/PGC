#!/usr/bin/env bash
echo ""
echo "Connecting Authentication Server..."
./as Client1#1.2.3.4#TGS1 > tmp1
echo "Authentication Server:"
echo | cat tmp1
echo ""
echo "call to Decrypter"
./decrypter Client1 "$(< tmp1)" > tmp2
echo "Decrypt Sequence:"
echo | cat tmp2
echo ""
echo "call to TGS..."
#echo " Ticket granting server"
./tgs Client1#1.2.3.4#V1#"$(< tmp2)" > tmp3
echo "Ticket Granting Server tgs:"
echo | cat tmp3
echo ""
echo "Server Call......"
./server Client1#1.2.3.4#V1#"$(< tmp3)" > tmp4
echo "Ticket Granted - Session Established"
echo | cat tmp4
echo ""

rm tmp*
