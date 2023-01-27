contract Contract {
    
    function main() {
        memory[0x40:0x60] = 0x80;
        var var0 = msg.value;
    
        if (var0) { revert(memory[0x00:0x00]); }
    
        if (msg.data.length < 0x04) { revert(memory[0x00:0x00]); }
    
        var0 = msg.data[0x00:0x20] >> 0xe0;
    
        if (0x621005d7 > var0) {
            if (0x3695f71c > var0) {
                if (0x1c5e933f > var0) {
                    if (var0 == 0x06fdde03) {
                        // Dispatch table entry for name()
                        var var1 = 0x0208;
                        var1 = name();
                        var temp0 = memory[0x40:0x60];
                        var var2 = temp0;
                        var var3 = var2;
                        var temp1 = var3 + 0x20;
                        memory[var3:var3 + 0x20] = temp1 - var3;
                        var temp2 = var1;
                        memory[temp1:temp1 + 0x20] = memory[temp2:temp2 + 0x20];
                        var var4 = temp1 + 0x20;
                        var var5 = temp2 + 0x20;
                        var var6 = memory[temp2:temp2 + 0x20];
                        var var7 = var6;
                        var var8 = var4;
                        var var9 = var5;
                        var var10 = 0x00;
                    
                        if (var10 >= var7) {
                        label_0248:
                            var temp3 = var6;
                            var4 = temp3 + var4;
                            var5 = temp3 & 0x1f;
                        
                            if (!var5) {
                                var temp4 = memory[0x40:0x60];
                                return memory[temp4:temp4 + var4 - temp4];
                            } else {
                                var temp5 = var5;
                                var temp6 = var4 - temp5;
                                memory[temp6:temp6 + 0x20] = ~(0x0100 ** (0x20 - temp5) - 0x01) & memory[temp6:temp6 + 0x20];
                                var temp7 = memory[0x40:0x60];
                                return memory[temp7:temp7 + (temp6 + 0x20) - temp7];
                            }
                        } else {
                        label_0236:
                            var temp8 = var10;
                            memory[var8 + temp8:var8 + temp8 + 0x20] = memory[var9 + temp8:var9 + temp8 + 0x20];
                            var10 = temp8 + 0x20;
                        
                            if (var10 >= var7) { goto label_0248; }
                            else { goto label_0236; }
                        }
                    } else if (var0 == 0x095ea7b3) {
                        // Dispatch table entry for approve(address,uint256)
                        var1 = 0x02cf;
                        var2 = 0x04;
                        var3 = msg.data.length - var2;
                    
                        if (var3 < 0x40) { revert(memory[0x00:0x00]); }
                    
                        var1 = approve(var2, var3);
                        var temp9 = memory[0x40:0x60];
                        memory[temp9:temp9 + 0x20] = !!var1;
                        var temp10 = memory[0x40:0x60];
                        return memory[temp10:temp10 + (temp9 + 0x20) - temp10];
                    } else if (var0 == 0x12d8829f) {
                        // Dispatch table entry for 0x12d8829f (unknown)
                        var1 = 0x02f1;
                        var2 = func_0B26();
                        var temp11 = memory[0x40:0x60];
                        memory[temp11:temp11 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                        var temp12 = memory[0x40:0x60];
                        return memory[temp12:temp12 + (temp11 + 0x20) - temp12];
                    } else if (var0 == 0x18160ddd) {
                        // Dispatch table entry for totalSupply()
                        var1 = 0x033b;
                        var1 = totalSupply();
                        var temp13 = memory[0x40:0x60];
                        memory[temp13:temp13 + 0x20] = var1;
                        var temp14 = memory[0x40:0x60];
                        return memory[temp14:temp14 + (temp13 + 0x20) - temp14];
                    } else { revert(memory[0x00:0x00]); }
                } else if (var0 == 0x1c5e933f) {
                    // Dispatch table entry for 0x1c5e933f (unknown)
                    var1 = 0x0359;
                    var2 = func_0B56();
                    var temp15 = memory[0x40:0x60];
                    memory[temp15:temp15 + 0x20] = var2;
                    var temp16 = memory[0x40:0x60];
                    return memory[temp16:temp16 + (temp15 + 0x20) - temp16];
                } else if (var0 == 0x23b872dd) {
                    // Dispatch table entry for transferFrom(address,address,uint256)
                    var1 = 0x03db;
                    var2 = 0x04;
                    var3 = msg.data.length - var2;
                
                    if (var3 < 0x60) { revert(memory[0x00:0x00]); }
                
                    var1 = transferFrom(var2, var3);
                    var temp17 = memory[0x40:0x60];
                    memory[temp17:temp17 + 0x20] = !!var1;
                    var temp18 = memory[0x40:0x60];
                    return memory[temp18:temp18 + (temp17 + 0x20) - temp18];
                } else if (var0 == 0x2f74c82e) {
                    // Dispatch table entry for 0x2f74c82e (unknown)
                    var1 = 0x03fd;
                    var2 = func_0E90();
                    var temp19 = memory[0x40:0x60];
                    memory[temp19:temp19 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                    var temp20 = memory[0x40:0x60];
                    return memory[temp20:temp20 + (temp19 + 0x20) - temp20];
                } else if (var0 == 0x313ce567) {
                    // Dispatch table entry for decimals()
                    var1 = 0x0447;
                    var1 = decimals();
                    var temp21 = memory[0x40:0x60];
                    memory[temp21:temp21 + 0x20] = var1 & 0xff;
                    var temp22 = memory[0x40:0x60];
                    return memory[temp22:temp22 + (temp21 + 0x20) - temp22];
                } else { revert(memory[0x00:0x00]); }
            } else if (0x3f4ba83a > var0) {
                if (var0 == 0x3695f71c) {
                    // Dispatch table entry for 0x3695f71c (unknown)
                    var1 = 0x046b;
                    var2 = func_0ECD();
                    var temp23 = memory[0x40:0x60];
                    memory[temp23:temp23 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                    var temp24 = memory[0x40:0x60];
                    return memory[temp24:temp24 + (temp23 + 0x20) - temp24];
                } else if (var0 == 0x36ec6b8e) {
                    // Dispatch table entry for 0x36ec6b8e (unknown)
                    var1 = 0x04b5;
                    var2 = func_0EF3();
                    var temp25 = memory[0x40:0x60];
                    memory[temp25:temp25 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                    var temp26 = memory[0x40:0x60];
                    return memory[temp26:temp26 + (temp25 + 0x20) - temp26];
                } else if (var0 == 0x39509351) {
                    // Dispatch table entry for increaseAllowance(address,uint256)
                    var1 = 0x0543;
                    var2 = 0x04;
                    var3 = msg.data.length - var2;
                
                    if (var3 < 0x40) { revert(memory[0x00:0x00]); }
                
                    var1 = increaseAllowance(var2, var3);
                    var temp27 = memory[0x40:0x60];
                    memory[temp27:temp27 + 0x20] = !!var1;
                    var temp28 = memory[0x40:0x60];
                    return memory[temp28:temp28 + (temp27 + 0x20) - temp28];
                } else if (var0 == 0x3a34b6c6) {
                    // Dispatch table entry for 0x3a34b6c6 (unknown)
                    var1 = 0x0565;
                    var2 = func_0F47();
                    var temp29 = memory[0x40:0x60];
                    memory[temp29:temp29 + 0x20] = var2;
                    var temp30 = memory[0x40:0x60];
                    return memory[temp30:temp30 + (temp29 + 0x20) - temp30];
                } else { revert(memory[0x00:0x00]); }
            } else if (var0 == 0x3f4ba83a) {
                // Dispatch table entry for unpause()
                var1 = 0x0583;
                unpause();
                stop();
            } else if (var0 == 0x46fbf68e) {
                // Dispatch table entry for isPauser(address)
                var1 = 0x05c7;
                var2 = 0x04;
                var3 = msg.data.length - var2;
            
                if (var3 < 0x20) { revert(memory[0x00:0x00]); }
            
                var1 = isPauser(var2, var3);
                var temp31 = memory[0x40:0x60];
                memory[temp31:temp31 + 0x20] = !!var1;
                var temp32 = memory[0x40:0x60];
                return memory[temp32:temp32 + (temp31 + 0x20) - temp32];
            } else if (var0 == 0x53d4edba) {
                // Dispatch table entry for 0x53d4edba (unknown)
                var1 = 0x05e9;
                var2 = func_101F();
                var temp33 = memory[0x40:0x60];
                memory[temp33:temp33 + 0x20] = var2;
                var temp34 = memory[0x40:0x60];
                return memory[temp34:temp34 + (temp33 + 0x20) - temp34];
            } else if (var0 == 0x5c975abb) {
                // Dispatch table entry for paused()
                var1 = 0x0607;
                var1 = paused();
                var temp35 = memory[0x40:0x60];
                memory[temp35:temp35 + 0x20] = !!var1;
                var temp36 = memory[0x40:0x60];
                return memory[temp36:temp36 + (temp35 + 0x20) - temp36];
            } else { revert(memory[0x00:0x00]); }
        } else if (0x8456cb59 > var0) {
            if (0x70a08231 > var0) {
                if (var0 == 0x621005d7) {
                    // Dispatch table entry for 0x621005d7 (unknown)
                    var1 = 0x0629;
                    var2 = func_1046();
                    var temp37 = memory[0x40:0x60];
                    memory[temp37:temp37 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                    var temp38 = memory[0x40:0x60];
                    return memory[temp38:temp38 + (temp37 + 0x20) - temp38];
                } else if (var0 == 0x680a8ca5) {
                    // Dispatch table entry for 0x680a8ca5 (unknown)
                    var1 = 0x0673;
                    var2 = func_106C();
                    var temp39 = memory[0x40:0x60];
                    memory[temp39:temp39 + 0x20] = var2;
                    var temp40 = memory[0x40:0x60];
                    return memory[temp40:temp40 + (temp39 + 0x20) - temp40];
                } else if (var0 == 0x6cc5c0fd) {
                    // Dispatch table entry for 0x6cc5c0fd (unknown)
                    var1 = 0x0691;
                    var2 = func_107C();
                    var temp41 = memory[0x40:0x60];
                    memory[temp41:temp41 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
                    var temp42 = memory[0x40:0x60];
                    return memory[temp42:temp42 + (temp41 + 0x20) - temp42];
                } else if (var0 == 0x6ef8d66d) {
                    // Dispatch table entry for renouncePauser()
                    var1 = 0x06db;
                    renouncePauser();
                    stop();
                } else { revert(memory[0x00:0x00]); }
            } else if (var0 == 0x70a08231) {
                // Dispatch table entry for balanceOf(address)
                var1 = 0x071f;
                var2 = 0x04;
                var3 = msg.data.length - var2;
            
                if (var3 < 0x20) { revert(memory[0x00:0x00]); }
            
                var1 = balanceOf(var2, var3);
                var temp43 = memory[0x40:0x60];
                memory[temp43:temp43 + 0x20] = var1;
                var temp44 = memory[0x40:0x60];
                return memory[temp44:temp44 + (temp43 + 0x20) - temp44];
            } else if (var0 == 0x70b86f23) {
                // Dispatch table entry for 0x70b86f23 (unknown)
                var1 = 0x073d;
                var2 = func_10F5();
                var temp45 = memory[0x40:0x60];
                memory[temp45:temp45 + 0x20] = var2;
                var temp46 = memory[0x40:0x60];
                return memory[temp46:temp46 + (temp45 + 0x20) - temp46];
            } else if (var0 == 0x767c2e2d) {
                // Dispatch table entry for 0x767c2e2d (unknown)
                var1 = 0x075b;
                var2 = func_1105();
                var temp47 = memory[0x40:0x60];
                memory[temp47:temp47 + 0x20] = var2;
                var temp48 = memory[0x40:0x60];
                return memory[temp48:temp48 + (temp47 + 0x20) - temp48];
            } else if (var0 == 0x82dc1ec4) {
                // Dispatch table entry for addPauser(address)
                var1 = 0x07b3;
                var2 = 0x04;
                var3 = msg.data.length - var2;
            
                if (var3 < 0x20) { revert(memory[0x00:0x00]); }
            
                addPauser(var2, var3);
                stop();
            } else { revert(memory[0x00:0x00]); }
        } else if (0xa9059cbb > var0) {
            if (var0 == 0x8456cb59) {
                // Dispatch table entry for pause()
                var1 = 0x07bd;
                pause();
                stop();
            } else if (var0 == 0x95d89b41) {
                // Dispatch table entry for symbol()
                var1 = 0x07c7;
                var1 = symbol();
                var temp49 = memory[0x40:0x60];
                var2 = temp49;
                var3 = var2;
                var temp50 = var3 + 0x20;
                memory[var3:var3 + 0x20] = temp50 - var3;
                var temp51 = var1;
                memory[temp50:temp50 + 0x20] = memory[temp51:temp51 + 0x20];
                var4 = temp50 + 0x20;
                var5 = temp51 + 0x20;
                var6 = memory[temp51:temp51 + 0x20];
                var7 = var6;
                var8 = var4;
                var9 = var5;
                var10 = 0x00;
            
                if (var10 >= var7) {
                label_0807:
                    var temp52 = var6;
                    var4 = temp52 + var4;
                    var5 = temp52 & 0x1f;
                
                    if (!var5) {
                        var temp53 = memory[0x40:0x60];
                        return memory[temp53:temp53 + var4 - temp53];
                    } else {
                        var temp54 = var5;
                        var temp55 = var4 - temp54;
                        memory[temp55:temp55 + 0x20] = ~(0x0100 ** (0x20 - temp54) - 0x01) & memory[temp55:temp55 + 0x20];
                        var temp56 = memory[0x40:0x60];
                        return memory[temp56:temp56 + (temp55 + 0x20) - temp56];
                    }
                } else {
                label_07F5:
                    var temp57 = var10;
                    memory[var8 + temp57:var8 + temp57 + 0x20] = memory[var9 + temp57:var9 + temp57 + 0x20];
                    var10 = temp57 + 0x20;
                
                    if (var10 >= var7) { goto label_0807; }
                    else { goto label_07F5; }
                }
            } else if (var0 == 0xa457c2d7) {
                // Dispatch table entry for decreaseAllowance(address,uint256)
                var1 = 0x088e;
                var2 = 0x04;
                var3 = msg.data.length - var2;
            
                if (var3 < 0x40) { revert(memory[0x00:0x00]); }
            
                var1 = decreaseAllowance(var2, var3);
                var temp58 = memory[0x40:0x60];
                memory[temp58:temp58 + 0x20] = !!var1;
                var temp59 = memory[0x40:0x60];
                return memory[temp59:temp59 + (temp58 + 0x20) - temp59];
            } else if (var0 == 0xa8942ed1) {
                // Dispatch table entry for 0xa8942ed1 (unknown)
                var1 = 0x08b0;
                var2 = func_12AF();
                var temp60 = memory[0x40:0x60];
                memory[temp60:temp60 + 0x20] = var2;
                var temp61 = memory[0x40:0x60];
                return memory[temp61:temp61 + (temp60 + 0x20) - temp61];
            } else { revert(memory[0x00:0x00]); }
        } else if (var0 == 0xa9059cbb) {
            // Dispatch table entry for transfer(address,uint256)
            var1 = 0x0912;
            var2 = 0x04;
            var3 = msg.data.length - var2;
        
            if (var3 < 0x40) { revert(memory[0x00:0x00]); }
        
            var1 = transfer(var2, var3);
            var temp62 = memory[0x40:0x60];
            memory[temp62:temp62 + 0x20] = !!var1;
            var temp63 = memory[0x40:0x60];
            return memory[temp63:temp63 + (temp62 + 0x20) - temp63];
        } else if (var0 == 0xadcde06f) {
            // Dispatch table entry for 0xadcde06f (unknown)
            var1 = 0x0934;
            var2 = func_15E6();
            var temp64 = memory[0x40:0x60];
            memory[temp64:temp64 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
            var temp65 = memory[0x40:0x60];
            return memory[temp65:temp65 + (temp64 + 0x20) - temp65];
        } else if (var0 == 0xdd62ed3e) {
            // Dispatch table entry for allowance(address,address)
            var1 = 0x09d8;
            var2 = 0x04;
            var3 = msg.data.length - var2;
        
            if (var3 < 0x40) { revert(memory[0x00:0x00]); }
        
            var1 = allowance(var2, var3);
            var temp66 = memory[0x40:0x60];
            memory[temp66:temp66 + 0x20] = var1;
            var temp67 = memory[0x40:0x60];
            return memory[temp67:temp67 + (temp66 + 0x20) - temp67];
        } else if (var0 == 0xdee28f78) {
            // Dispatch table entry for 0xdee28f78 (unknown)
            var1 = 0x09f6;
            var2 = func_1693();
            var temp68 = memory[0x40:0x60];
            memory[temp68:temp68 + 0x20] = var2;
            var temp69 = memory[0x40:0x60];
            return memory[temp69:temp69 + (temp68 + 0x20) - temp69];
        } else if (var0 == 0xfe28a815) {
            // Dispatch table entry for 0xfe28a815 (unknown)
            var1 = 0x0a14;
            var2 = func_16A3();
            var temp70 = memory[0x40:0x60];
            memory[temp70:temp70 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
            var temp71 = memory[0x40:0x60];
            return memory[temp71:temp71 + (temp70 + 0x20) - temp71];
        } else { revert(memory[0x00:0x00]); }
    }
    
    function approve(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20];
        var var0 = 0x00;
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x0b1e;
        var var2 = arg0;
        var var3 = arg1;
        return func_16C9(var2, var3);
    }
    
    function transferFrom(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        var temp1 = temp0 + 0x20;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp1:temp1 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        var var0 = msg.data[temp1 + 0x20:temp1 + 0x20 + 0x20];
        var var1 = 0x00;
        var var2 = arg0;
        var var3 = var0;
    
        if (var2 & 0xffffffffffffffffffffffffffffffffffffffff == storage[0x0a] & 0xffffffffffffffffffffffffffffffffffffffff) {
            var temp12 = memory[0x40:0x60];
            memory[temp12:temp12 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp13 = temp12 + 0x04;
            var temp14 = temp13 + 0x20;
            memory[temp13:temp13 + 0x20] = temp14 - temp13;
            memory[temp14:temp14 + 0x20] = 0x32;
            var temp15 = temp14 + 0x20;
            memory[temp15:temp15 + 0x32] = code[0x1fef:0x2021];
            var temp16 = memory[0x40:0x60];
            revert(memory[temp16:temp16 + (temp15 + 0x40) - temp16]);
        } else if (var2 & 0xffffffffffffffffffffffffffffffffffffffff == storage[0x08] & 0xffffffffffffffffffffffffffffffffffffffff) {
            var4 = 0x00;
            var5 = 0x0c94;
            var6 = storage[0x08] & 0xffffffffffffffffffffffffffffffffffffffff;
            var5 = func_10AD(var6);
            var4 = 0x07a025705a712ea438000000 - var5;
            var5 = 0x0cd7;
            var6 = 0x64;
            var7 = 0x0cc9;
            var8 = 0x07a025705a712ea438000000;
            var9 = 0x0a;
            var7 = func_16E0(var8, var9);
            var5 = func_0CC9(var6, var7);
            var6 = 0x0cea;
            var7 = var4;
            var8 = var3;
            var6 = func_1740(var7, var8);
        
            if (var6 <= var5) {
                var4 = 0x0e85;
                var5 = arg0;
                var6 = arg1;
                var7 = var0;
                var4 = func_175F(var5, var6, var7);
                goto label_0E85;
            } else {
                var temp7 = memory[0x40:0x60];
                memory[temp7:temp7 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
                var temp8 = temp7 + 0x04;
                var temp9 = temp8 + 0x20;
                memory[temp8:temp8 + 0x20] = temp9 - temp8;
                memory[temp9:temp9 + 0x20] = 0x3d;
                var temp10 = temp9 + 0x20;
                memory[temp10:temp10 + 0x3d] = code[0x2021:0x205e];
                var temp11 = memory[0x40:0x60];
                revert(memory[temp11:temp11 + (temp10 + 0x40) - temp11]);
            }
        } else if (var2 & 0xffffffffffffffffffffffffffffffffffffffff != storage[0x09] & 0xffffffffffffffffffffffffffffffffffffffff) {
        label_0E79:
            var var4 = 0x0e85;
            var var5 = arg0;
            var var6 = arg1;
            var var7 = var0;
            var4 = func_175F(var5, var6, var7);
        
        label_0E85:
            return var4;
        } else {
            var4 = 0x00;
            var5 = 0x0dca;
            var6 = storage[0x09] & 0xffffffffffffffffffffffffffffffffffffffff;
            var5 = func_10AD(var6);
            var4 = 0x04b7af069768bb3a34000000 - var5;
            var5 = 0x0e0d;
            var6 = 0x64;
            var7 = 0x0dff;
            var var8 = 0x04b7af069768bb3a34000000;
            var var9 = 0x0a;
            var7 = func_16E0(var8, var9);
            var5 = func_0DFF(var6, var7);
            var6 = 0x0e20;
            var7 = var4;
            var8 = var3;
            var6 = func_1740(var7, var8);
        
            if (var6 <= var5) { goto label_0E79; }
        
            var temp2 = memory[0x40:0x60];
            memory[temp2:temp2 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp3 = temp2 + 0x04;
            var temp4 = temp3 + 0x20;
            memory[temp3:temp3 + 0x20] = temp4 - temp3;
            memory[temp4:temp4 + 0x20] = 0x39;
            var temp5 = temp4 + 0x20;
            memory[temp5:temp5 + 0x39] = code[0x1fb6:0x1fef];
            var temp6 = memory[0x40:0x60];
            revert(memory[temp6:temp6 + (temp5 + 0x40) - temp6]);
        }
    }
    
    function increaseAllowance(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20];
        var var0 = 0x00;
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x0f3f;
        var var2 = arg0;
        var var3 = arg1;
        return func_178F(var2, var3);
    }
    
    function isPauser(var arg0, var arg1) returns (var r0) {
        arg0 = msg.data[arg0:arg0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        r0 = func_1002(arg0);
        // Error: Could not resolve method call return address!
    }
    
    function balanceOf(var arg0, var arg1) returns (var r0) {
        arg0 = msg.data[arg0:arg0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        r0 = func_10AD(arg0);
        // Error: Could not resolve method call return address!
    }
    
    function addPauser(var arg0, var arg1) {
        arg0 = msg.data[arg0:arg0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = 0x111e;
        var var0 = msg.sender;
        arg1 = func_1002(var0);
    
        if (!arg1) { revert(memory[0x00:0x00]); }
    
        arg1 = 0x1130;
        var0 = arg0;
        func_1920(var0);
    }
    
    function decreaseAllowance(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20];
        var var0 = 0x00;
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x12a7;
        var var2 = arg0;
        var var3 = arg1;
        return func_197A(var2, var3);
    }
    
    function transfer(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20];
        var var0 = 0x00;
        var var1 = msg.sender;
        var var2 = arg1;
    
        if (var1 & 0xffffffffffffffffffffffffffffffffffffffff == storage[0x0a] & 0xffffffffffffffffffffffffffffffffffffffff) {
            var temp11 = memory[0x40:0x60];
            memory[temp11:temp11 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp12 = temp11 + 0x04;
            var temp13 = temp12 + 0x20;
            memory[temp12:temp12 + 0x20] = temp13 - temp12;
            memory[temp13:temp13 + 0x20] = 0x32;
            var temp14 = temp13 + 0x20;
            memory[temp14:temp14 + 0x32] = code[0x1fef:0x2021];
            var temp15 = memory[0x40:0x60];
            revert(memory[temp15:temp15 + (temp14 + 0x40) - temp15]);
        } else if (var1 & 0xffffffffffffffffffffffffffffffffffffffff == storage[0x08] & 0xffffffffffffffffffffffffffffffffffffffff) {
            var3 = 0x00;
            var4 = 0x13ec;
            var5 = storage[0x08] & 0xffffffffffffffffffffffffffffffffffffffff;
            var4 = func_10AD(var5);
            var3 = 0x07a025705a712ea438000000 - var4;
            var4 = 0x142f;
            var5 = 0x64;
            var6 = 0x1421;
            var7 = 0x07a025705a712ea438000000;
            var8 = 0x0a;
            var6 = func_16E0(var7, var8);
            var4 = func_1421(var5, var6);
            var5 = 0x1442;
            var6 = var3;
            var7 = var2;
            var5 = func_1740(var6, var7);
        
            if (var5 <= var4) {
                var3 = 0x15dc;
                var4 = arg0;
                var5 = arg1;
                var3 = func_1A1F(var4, var5);
                goto label_15DC;
            } else {
                var temp6 = memory[0x40:0x60];
                memory[temp6:temp6 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
                var temp7 = temp6 + 0x04;
                var temp8 = temp7 + 0x20;
                memory[temp7:temp7 + 0x20] = temp8 - temp7;
                memory[temp8:temp8 + 0x20] = 0x3d;
                var temp9 = temp8 + 0x20;
                memory[temp9:temp9 + 0x3d] = code[0x2021:0x205e];
                var temp10 = memory[0x40:0x60];
                revert(memory[temp10:temp10 + (temp9 + 0x40) - temp10]);
            }
        } else if (var1 & 0xffffffffffffffffffffffffffffffffffffffff != storage[0x09] & 0xffffffffffffffffffffffffffffffffffffffff) {
        label_15D1:
            var var3 = 0x15dc;
            var var4 = arg0;
            var var5 = arg1;
            var3 = func_1A1F(var4, var5);
        
        label_15DC:
            return var3;
        } else {
            var3 = 0x00;
            var4 = 0x1522;
            var5 = storage[0x09] & 0xffffffffffffffffffffffffffffffffffffffff;
            var4 = func_10AD(var5);
            var3 = 0x04b7af069768bb3a34000000 - var4;
            var4 = 0x1565;
            var5 = 0x64;
            var var6 = 0x1557;
            var var7 = 0x04b7af069768bb3a34000000;
            var var8 = 0x0a;
            var6 = func_16E0(var7, var8);
            var4 = func_1557(var5, var6);
            var5 = 0x1578;
            var6 = var3;
            var7 = var2;
            var5 = func_1740(var6, var7);
        
            if (var5 <= var4) { goto label_15D1; }
        
            var temp1 = memory[0x40:0x60];
            memory[temp1:temp1 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp2 = temp1 + 0x04;
            var temp3 = temp2 + 0x20;
            memory[temp2:temp2 + 0x20] = temp3 - temp2;
            memory[temp3:temp3 + 0x20] = 0x39;
            var temp4 = temp3 + 0x20;
            memory[temp4:temp4 + 0x39] = code[0x1fb6:0x1fef];
            var temp5 = memory[0x40:0x60];
            revert(memory[temp5:temp5 + (temp4 + 0x40) - temp5]);
        }
    }
    
    function allowance(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = msg.data[temp0:temp0 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        arg1 = msg.data[temp0 + 0x20:temp0 + 0x20 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x00:0x20] = arg0 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x01;
        var temp1 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = arg1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = temp1;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function name() returns (var r0) {
        var var0 = 0x60;
        var temp0 = storage[0x05];
        var temp1 = (!(temp0 & 0x01) * 0x0100 - 0x01 & temp0) / 0x02;
        var temp2 = memory[0x40:0x60];
        memory[0x40:0x60] = temp2 + (temp1 + 0x1f) / 0x20 * 0x20 + 0x20;
        var var1 = temp2;
        var var2 = 0x05;
        var var3 = temp1;
        memory[var1:var1 + 0x20] = var3;
        var var4 = var1 + 0x20;
        var var5 = var2;
        var temp3 = storage[var5];
        var var6 = (!(temp3 & 0x01) * 0x0100 - 0x01 & temp3) / 0x02;
    
        if (!var6) {
        label_0AEE:
            return var1;
        } else if (0x1f < var6) {
            var temp4 = var4;
            var temp5 = temp4 + var6;
            var4 = temp5;
            memory[0x00:0x20] = var5;
            var temp6 = keccak256(memory[0x00:0x20]);
            memory[temp4:temp4 + 0x20] = storage[temp6];
            var5 = temp6 + 0x01;
            var6 = temp4 + 0x20;
        
            if (var4 <= var6) { goto label_0AE5; }
        
        label_0AD1:
            var temp7 = var5;
            var temp8 = var6;
            memory[temp8:temp8 + 0x20] = storage[temp7];
            var5 = temp7 + 0x01;
            var6 = temp8 + 0x20;
        
            if (var4 > var6) { goto label_0AD1; }
        
        label_0AE5:
            var temp9 = var4;
            var temp10 = temp9 + (var6 - temp9 & 0x1f);
            var6 = temp9;
            var4 = temp10;
            goto label_0AEE;
        } else {
            var temp11 = var4;
            memory[temp11:temp11 + 0x20] = storage[var5] / 0x0100 * 0x0100;
            var4 = temp11 + 0x20;
            var6 = var6;
            goto label_0AEE;
        }
    }
    
    function func_0B26() returns (var r0) { return storage[0x0c] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function totalSupply() returns (var r0) { return storage[0x02]; }
    
    function func_0B56() returns (var r0) { return 0x04b7af069768bb3a34000000; }
    
    function func_0CC9(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = arg1;
        arg1 = temp0;
        var var0 = 0x00;
    
        if (arg1 <= var0) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x00;
        var var2 = arg1;
        var var3 = arg0;
    
        if (var2) { return var3 / var2; }
        else { assert(); }
    }
    
    function func_0DFF(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = arg1;
        arg1 = temp0;
        var var0 = 0x00;
    
        if (arg1 <= var0) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x00;
        var var2 = arg1;
        var var3 = arg0;
    
        if (var2) { return var3 / var2; }
        else { assert(); }
    }
    
    function func_0E90() returns (var r0) { return storage[0x0e] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function decimals() returns (var r0) { return storage[0x07] & 0xff; }
    
    function func_0ECD() returns (var r0) { return storage[0x0a] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function func_0EF3() returns (var r0) { return storage[0x0b] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function func_0F47() returns (var r0) { return 0x01cf389cd46047d030000000; }
    
    function unpause() {
        var var0 = 0x0f60;
        var var1 = msg.sender;
        var0 = func_1002(var1);
    
        if (!var0) { revert(memory[0x00:0x00]); }
    
        if (!(storage[0x04] & 0xff)) { revert(memory[0x00:0x00]); }
    
        storage[0x04] = (storage[0x04] & ~0xff) | 0x00;
        var temp0 = memory[0x40:0x60];
        memory[temp0:temp0 + 0x20] = msg.sender;
        var temp1 = memory[0x40:0x60];
        log(memory[temp1:temp1 + (temp0 + 0x20) - temp1], [0x5db9ee0a495bf2e6ff9c91a7834c1ba4fdd244a5e8aa4e537bd38aeae4b073aa]);
    }
    
    function func_1002(var arg0) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x1018;
        var var2 = 0x03;
        var var3 = arg0;
        return func_1834(var2, var3);
    }
    
    function func_101F() returns (var r0) { return 0x01193dcceea82b99d4000000; }
    
    function paused() returns (var r0) { return storage[0x04] & 0xff; }
    
    function func_1046() returns (var r0) { return storage[0x0d] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function func_106C() returns (var r0) { return 0x07a025705a712ea438000000; }
    
    function func_107C() returns (var r0) { return storage[0x08] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function renouncePauser() {
        var var0 = 0x10ab;
        var var1 = msg.sender;
        func_18C6(var1);
    }
    
    function func_10AD(var arg0) returns (var r0) {
        memory[0x00:0x20] = arg0 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x00;
        return storage[keccak256(memory[0x00:0x40])];
    }
    
    function func_10F5() returns (var r0) { return 0x0c57d476f1d9e9de6c000000; }
    
    function func_1105() returns (var r0) { return 0x02e87669c308736a04000000; }
    
    function pause() {
        var var0 = 0x113c;
        var var1 = msg.sender;
        var0 = func_1002(var1);
    
        if (!var0) { revert(memory[0x00:0x00]); }
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        storage[0x04] = (storage[0x04] & ~0xff) | 0x01;
        var temp0 = memory[0x40:0x60];
        memory[temp0:temp0 + 0x20] = msg.sender;
        var temp1 = memory[0x40:0x60];
        log(memory[temp1:temp1 + (temp0 + 0x20) - temp1], [0x62e78cea01bee320cd4e420270b5ea74000d11b0c9f74754ebdbfc544b05a258]);
    }
    
    function symbol() returns (var r0) {
        var var0 = 0x60;
        var temp0 = storage[0x06];
        var temp1 = (!(temp0 & 0x01) * 0x0100 - 0x01 & temp0) / 0x02;
        var temp2 = memory[0x40:0x60];
        memory[0x40:0x60] = temp2 + (temp1 + 0x1f) / 0x20 * 0x20 + 0x20;
        var var1 = temp2;
        var var2 = 0x06;
        var var3 = temp1;
        memory[var1:var1 + 0x20] = var3;
        var var4 = var1 + 0x20;
        var var5 = var2;
        var temp3 = storage[var5];
        var var6 = (!(temp3 & 0x01) * 0x0100 - 0x01 & temp3) / 0x02;
    
        if (!var6) {
        label_1277:
            return var1;
        } else if (0x1f < var6) {
            var temp4 = var4;
            var temp5 = temp4 + var6;
            var4 = temp5;
            memory[0x00:0x20] = var5;
            var temp6 = keccak256(memory[0x00:0x20]);
            memory[temp4:temp4 + 0x20] = storage[temp6];
            var5 = temp6 + 0x01;
            var6 = temp4 + 0x20;
        
            if (var4 <= var6) { goto label_126E; }
        
        label_125A:
            var temp7 = var5;
            var temp8 = var6;
            memory[temp8:temp8 + 0x20] = storage[temp7];
            var5 = temp7 + 0x01;
            var6 = temp8 + 0x20;
        
            if (var4 > var6) { goto label_125A; }
        
        label_126E:
            var temp9 = var4;
            var temp10 = temp9 + (var6 - temp9 & 0x1f);
            var6 = temp9;
            var4 = temp10;
            goto label_1277;
        } else {
            var temp11 = var4;
            memory[temp11:temp11 + 0x20] = storage[var5] / 0x0100 * 0x0100;
            var4 = temp11 + 0x20;
            var6 = var6;
            goto label_1277;
        }
    }
    
    function func_12AF() returns (var r0) { return 0xb5facfe5b81c365c000000; }
    
    function func_1421(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = arg1;
        arg1 = temp0;
        var var0 = 0x00;
    
        if (arg1 <= var0) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x00;
        var var2 = arg1;
        var var3 = arg0;
    
        if (var2) { return var3 / var2; }
        else { assert(); }
    }
    
    function func_1557(var arg0, var arg1) returns (var r0) {
        var temp0 = arg0;
        arg0 = arg1;
        arg1 = temp0;
        var var0 = 0x00;
    
        if (arg1 <= var0) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x00;
        var var2 = arg1;
        var var3 = arg0;
    
        if (var2) { return var3 / var2; }
        else { assert(); }
    }
    
    function func_15E6() returns (var r0) { return storage[0x07] / 0x0100 ** 0x01 & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function func_1693() returns (var r0) { return 0x01193dcceea82b99d4000000; }
    
    function func_16A3() returns (var r0) { return storage[0x09] & 0xffffffffffffffffffffffffffffffffffffffff; }
    
    function func_16C9(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x16d6;
        var var2 = msg.sender;
        var var3 = arg0;
        var var4 = arg1;
        func_1A4D(var2, var3, var4);
        return 0x01;
    }
    
    function func_16E0(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg0 == var0) { return 0x00; }
    
        var var1 = arg0 * arg1;
        var var2 = arg1;
        var var3 = arg0;
        var var4 = var1;
    
        if (!var3) { assert(); }
    
        if (var4 / var3 == var2) { return var1; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_1740(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var temp0 = arg0;
        var var1 = temp0 + arg1;
    
        if (var1 >= temp0) { return var1; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_175F(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x1786;
        var var2 = arg0;
        var var3 = arg1;
        var var4 = arg2;
        return func_1BAC(var2, var3, var4);
    }
    
    function func_178F(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x182a;
        var var2 = msg.sender;
        var var3 = arg0;
        var var4 = 0x1825;
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x01;
        var temp0 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = var3 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = temp0;
        var var5 = storage[keccak256(memory[0x00:0x40])];
        var var6 = arg1;
        var4 = func_1740(var5, var6);
        func_1825(var2, var3, var4);
        return 0x01;
    }
    
    function func_1825(var arg0, var arg1, var arg2) {
        func_1A4D(arg0, arg1, arg2);
        // Error: Could not resolve method call return address!
    }
    
    function func_1834(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 & 0xffffffffffffffffffffffffffffffffffffffff == var0 & 0xffffffffffffffffffffffffffffffffffffffff) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = arg0;
        return storage[keccak256(memory[0x00:0x40])] & 0xff;
    }
    
    function func_18C6(var arg0) {
        var var0 = 0x18da;
        var var1 = 0x03;
        var var2 = arg0;
        func_1C5D(var1, var2);
        var temp0 = memory[0x40:0x60];
        log(memory[temp0:temp0 + memory[0x40:0x60] - temp0], [0xcd265ebaf09df2871cc7bd4133404a235ba12eff2041bb89d9c714a2621c7c7e, stack[-1] & 0xffffffffffffffffffffffffffffffffffffffff]);
    }
    
    function func_1920(var arg0) {
        var var0 = 0x1934;
        var var1 = 0x03;
        var var2 = arg0;
        func_1D08(var1, var2);
        var temp0 = memory[0x40:0x60];
        log(memory[temp0:temp0 + memory[0x40:0x60] - temp0], [0x6719d08c1888103bea251a4ed56406bd0c3e69723c8a1686e017e7bbe159b6f8, stack[-1] & 0xffffffffffffffffffffffffffffffffffffffff]);
    }
    
    function func_197A(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x1a15;
        var var2 = msg.sender;
        var var3 = arg0;
        var var4 = 0x1a10;
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = 0x01;
        var temp0 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = var3 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = temp0;
        var var5 = storage[keccak256(memory[0x00:0x40])];
        var var6 = arg1;
        var4 = func_1DB4(var5, var6);
        func_1A10(var2, var3, var4);
        return 0x01;
    }
    
    function func_1A10(var arg0, var arg1, var arg2) {
        func_1A4D(arg0, arg1, arg2);
        // Error: Could not resolve method call return address!
    }
    
    function func_1A1F(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (storage[0x04] & 0xff) { revert(memory[0x00:0x00]); }
    
        var var1 = 0x1a45;
        var var2 = arg0;
        var var3 = arg1;
        return func_1DD4(var2, var3);
    }
    
    function func_1A4D(var arg0, var arg1, var arg2) {
        if (arg1 & 0xffffffffffffffffffffffffffffffffffffffff == 0xffffffffffffffffffffffffffffffffffffffff & 0x00) { revert(memory[0x00:0x00]); }
    
        if (arg0 & 0xffffffffffffffffffffffffffffffffffffffff == 0xffffffffffffffffffffffffffffffffffffffff & 0x00) { revert(memory[0x00:0x00]); }
    
        var temp0 = arg2;
        var temp1 = arg0;
        memory[0x00:0x20] = temp1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x01;
        var temp2 = keccak256(memory[0x00:0x40]);
        var temp3 = arg1;
        memory[0x00:0x20] = temp3 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = temp2;
        storage[keccak256(memory[0x00:0x40])] = temp0;
        var temp4 = memory[0x40:0x60];
        memory[temp4:temp4 + 0x20] = temp0;
        var temp5 = memory[0x40:0x60];
        log(memory[temp5:temp5 + (temp4 + 0x20) - temp5], [0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925, stack[-3] & 0xffffffffffffffffffffffffffffffffffffffff, stack[-2] & 0xffffffffffffffffffffffffffffffffffffffff]);
    }
    
    function func_1BAC(var arg0, var arg1, var arg2) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x1bb9;
        var var2 = arg0;
        var var3 = arg1;
        var var4 = arg2;
        func_1DEB(var2, var3, var4);
        var1 = 0x1c52;
        var2 = arg0;
        var3 = msg.sender;
        var4 = 0x1c4d;
        memory[0x00:0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x01;
        var temp0 = keccak256(memory[0x00:0x40]);
        memory[0x00:0x20] = msg.sender;
        memory[0x20:0x40] = temp0;
        var var5 = storage[keccak256(memory[0x00:0x40])];
        var var6 = arg2;
        var4 = func_1DB4(var5, var6);
        func_1C4D(var2, var3, var4);
        return 0x01;
    }
    
    function func_1C4D(var arg0, var arg1, var arg2) {
        func_1A4D(arg0, arg1, arg2);
        // Error: Could not resolve method call return address!
    }
    
    function func_1C5D(var arg0, var arg1) {
        if (arg1 & 0xffffffffffffffffffffffffffffffffffffffff == 0xffffffffffffffffffffffffffffffffffffffff & 0x00) { revert(memory[0x00:0x00]); }
    
        var var0 = 0x1ca1;
        var var1 = arg0;
        var var2 = arg1;
        var0 = func_1834(var1, var2);
    
        if (!var0) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = arg0;
        var temp0 = keccak256(memory[0x00:0x40]);
        storage[temp0] = (storage[temp0] & ~0xff) | 0x00;
    }
    
    function func_1D08(var arg0, var arg1) {
        if (arg1 & 0xffffffffffffffffffffffffffffffffffffffff == 0xffffffffffffffffffffffffffffffffffffffff & 0x00) { revert(memory[0x00:0x00]); }
    
        var var0 = 0x1d4c;
        var var1 = arg0;
        var var2 = arg1;
        var0 = func_1834(var1, var2);
    
        if (var0) { revert(memory[0x00:0x00]); }
    
        memory[0x00:0x20] = arg1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = arg0;
        var temp0 = keccak256(memory[0x00:0x40]);
        storage[temp0] = (storage[temp0] & ~0xff) | 0x01;
    }
    
    function func_1DB4(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
    
        if (arg1 <= arg0) { return arg0 - arg1; }
        else { revert(memory[0x00:0x00]); }
    }
    
    function func_1DD4(var arg0, var arg1) returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x1de1;
        var var2 = msg.sender;
        var var3 = arg0;
        var var4 = arg1;
        func_1DEB(var2, var3, var4);
        return 0x01;
    }
    
    function func_1DEB(var arg0, var arg1, var arg2) {
        if (arg1 & 0xffffffffffffffffffffffffffffffffffffffff == 0xffffffffffffffffffffffffffffffffffffffff & 0x00) { revert(memory[0x00:0x00]); }
    
        var var0 = 0x1e76;
        memory[0x00:0x20] = arg0 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x00;
        var var1 = storage[keccak256(memory[0x00:0x40])];
        var var2 = arg2;
        var0 = func_1DB4(var1, var2);
        memory[0x00:0x20] = arg0 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var0;
        var0 = 0x1f09;
        memory[0x00:0x20] = arg1 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x00;
        var1 = storage[keccak256(memory[0x00:0x40])];
        var2 = arg2;
        var0 = func_1740(var1, var2);
        var temp0 = arg1;
        memory[0x00:0x20] = temp0 & 0xffffffffffffffffffffffffffffffffffffffff;
        memory[0x20:0x40] = 0x00;
        storage[keccak256(memory[0x00:0x40])] = var0;
        var temp1 = memory[0x40:0x60];
        memory[temp1:temp1 + 0x20] = arg2;
        var temp2 = memory[0x40:0x60];
        log(memory[temp2:temp2 + (temp1 + 0x20) - temp2], [0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef, stack[-4] & 0xffffffffffffffffffffffffffffffffffffffff, stack[-3] & 0xffffffffffffffffffffffffffffffffffffffff]);
    }
}

D