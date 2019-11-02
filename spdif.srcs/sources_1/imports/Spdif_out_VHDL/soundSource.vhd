----------------------------------------------------------------------------------
-- Engineer: Mike Field hamster@snap.net.nz
-- 
-- Module Name:    soundSource - Behavioral 
-- Description: 
--
-- Simple sine wave to play over the S/PDIF interface
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity soundSource is
    Port ( clk       : in  STD_LOGIC;
           nextSample: in  STD_LOGIC;
           channelA    : in  STD_LOGIC;
           Sample    : out  STD_LOGIC_VECTOR (19 downto 0));
end soundSource;

architecture Behavioral of soundSource is
   signal sampleCounter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');  -- 0 to 256
begin
   
   process(clk, channelA, nextSample)
   begin
      if clk'event and clk = '1' then
          if nextSample = '1' and channelA = '1' then 
            sampleCounter <= sampleCounter+1;
         end if;
      end if;
   end process;
   
   process(sampleCounter)
   begin
   case sampleCounter is 
      when "00000000" => sample <= x"00000";
      when "00000001" => sample <= x"02bf0";
      when "00000010" => sample <= x"057e0";
      when "00000011" => sample <= x"083d0";
      when "00000100" => sample <= x"0afa0";
      when "00000101" => sample <= x"0db50";
      when "00000110" => sample <= x"106f0";
      when "00000111" => sample <= x"13250";
      when "00001000" => sample <= x"15d90";
      when "00001001" => sample <= x"188a0";
      when "00001010" => sample <= x"1b360";
      when "00001011" => sample <= x"1ddf0";
      when "00001100" => sample <= x"20830";
      when "00001101" => sample <= x"23210";
      when "00001110" => sample <= x"25bb0";
      when "00001111" => sample <= x"284e0";
      when "00010000" => sample <= x"2adc0";
      when "00010001" => sample <= x"2d630";
      when "00010010" => sample <= x"2fe20";
      when "00010011" => sample <= x"325b0";
      when "00010100" => sample <= x"34cb0";
      when "00010101" => sample <= x"37340";
      when "00010110" => sample <= x"39940";
      when "00010111" => sample <= x"3beb0";
      when "00011000" => sample <= x"3e390";
      when "00011001" => sample <= x"407d0";
      when "00011010" => sample <= x"42b70";
      when "00011011" => sample <= x"44e70";
      when "00011100" => sample <= x"470d0";
      when "00011101" => sample <= x"49270";
      when "00011110" => sample <= x"4b360";
      when "00011111" => sample <= x"4d3a0";
      when "00100000" => sample <= x"4f320";
      when "00100001" => sample <= x"511d0";
      when "00100010" => sample <= x"52fc0";
      when "00100011" => sample <= x"54ce0";
      when "00100100" => sample <= x"56930";
      when "00100101" => sample <= x"584b0";
      when "00100110" => sample <= x"59f50";
      when "00100111" => sample <= x"5b910";
      when "00101000" => sample <= x"5d1f0";
      when "00101001" => sample <= x"5e9f0";
      when "00101010" => sample <= x"60100";
      when "00101011" => sample <= x"61730";
      when "00101100" => sample <= x"62c60";
      when "00101101" => sample <= x"640a0";
      when "00101110" => sample <= x"653f0";
      when "00101111" => sample <= x"66640";
      when "00110000" => sample <= x"67790";
      when "00110001" => sample <= x"687e0";
      when "00110010" => sample <= x"69730";
      when "00110011" => sample <= x"6a580";
      when "00110100" => sample <= x"6b2d0";
      when "00110101" => sample <= x"6bf10";
      when "00110110" => sample <= x"6ca40";
      when "00110111" => sample <= x"6d470";
      when "00111000" => sample <= x"6dd90";
      when "00111001" => sample <= x"6e590";
      when "00111010" => sample <= x"6ec90";
      when "00111011" => sample <= x"6f280";
      when "00111100" => sample <= x"6f750";
      when "00111101" => sample <= x"6fb20";
      when "00111110" => sample <= x"6fdd0";
      when "00111111" => sample <= x"6ff70";
      when "01000000" => sample <= x"70000";
      when "01000001" => sample <= x"6ff70";
      when "01000010" => sample <= x"6fdd0";
      when "01000011" => sample <= x"6fb20";
      when "01000100" => sample <= x"6f750";
      when "01000101" => sample <= x"6f280";
      when "01000110" => sample <= x"6ec90";
      when "01000111" => sample <= x"6e590";
      when "01001000" => sample <= x"6dd90";
      when "01001001" => sample <= x"6d470";
      when "01001010" => sample <= x"6ca40";
      when "01001011" => sample <= x"6bf10";
      when "01001100" => sample <= x"6b2d0";
      when "01001101" => sample <= x"6a580";
      when "01001110" => sample <= x"69730";
      when "01001111" => sample <= x"687e0";
      when "01010000" => sample <= x"67790";
      when "01010001" => sample <= x"66640";
      when "01010010" => sample <= x"653f0";
      when "01010011" => sample <= x"640a0";
      when "01010100" => sample <= x"62c60";
      when "01010101" => sample <= x"61730";
      when "01010110" => sample <= x"60100";
      when "01010111" => sample <= x"5e9f0";
      when "01011000" => sample <= x"5d1f0";
      when "01011001" => sample <= x"5b910";
      when "01011010" => sample <= x"59f50";
      when "01011011" => sample <= x"584b0";
      when "01011100" => sample <= x"56930";
      when "01011101" => sample <= x"54ce0";
      when "01011110" => sample <= x"52fc0";
      when "01011111" => sample <= x"511d0";
      when "01100000" => sample <= x"4f320";
      when "01100001" => sample <= x"4d3a0";
      when "01100010" => sample <= x"4b360";
      when "01100011" => sample <= x"49270";
      when "01100100" => sample <= x"470d0";
      when "01100101" => sample <= x"44e70";
      when "01100110" => sample <= x"42b70";
      when "01100111" => sample <= x"407d0";
      when "01101000" => sample <= x"3e390";
      when "01101001" => sample <= x"3beb0";
      when "01101010" => sample <= x"39940";
      when "01101011" => sample <= x"37340";
      when "01101100" => sample <= x"34cb0";
      when "01101101" => sample <= x"325b0";
      when "01101110" => sample <= x"2fe20";
      when "01101111" => sample <= x"2d630";
      when "01110000" => sample <= x"2adc0";
      when "01110001" => sample <= x"284e0";
      when "01110010" => sample <= x"25bb0";
      when "01110011" => sample <= x"23210";
      when "01110100" => sample <= x"20830";
      when "01110101" => sample <= x"1ddf0";
      when "01110110" => sample <= x"1b360";
      when "01110111" => sample <= x"188a0";
      when "01111000" => sample <= x"15d90";
      when "01111001" => sample <= x"13250";
      when "01111010" => sample <= x"106f0";
      when "01111011" => sample <= x"0db50";
      when "01111100" => sample <= x"0afa0";
      when "01111101" => sample <= x"083d0";
      when "01111110" => sample <= x"057e0";
      when "01111111" => sample <= x"02bf0";
      when "10000000" => sample <= x"00000";
      when "10000001" => sample <= x"fd410";
      when "10000010" => sample <= x"fa820";
      when "10000011" => sample <= x"f7c30";
      when "10000100" => sample <= x"f5060";
      when "10000101" => sample <= x"f24b0";
      when "10000110" => sample <= x"ef920";
      when "10000111" => sample <= x"ecdb0";
      when "10001000" => sample <= x"ea270";
      when "10001001" => sample <= x"e7770";
      when "10001010" => sample <= x"e4ca0";
      when "10001011" => sample <= x"e2210";
      when "10001100" => sample <= x"df7e0";
      when "10001101" => sample <= x"dcdf0";
      when "10001110" => sample <= x"da450";
      when "10001111" => sample <= x"d7b20";
      when "10010000" => sample <= x"d5240";
      when "10010001" => sample <= x"d29d0";
      when "10010010" => sample <= x"d01e0";
      when "10010011" => sample <= x"cda50";
      when "10010100" => sample <= x"cb350";
      when "10010101" => sample <= x"c8cc0";
      when "10010110" => sample <= x"c66c0";
      when "10010111" => sample <= x"c4150";
      when "10011000" => sample <= x"c1c70";
      when "10011001" => sample <= x"bf830";
      when "10011010" => sample <= x"bd490";
      when "10011011" => sample <= x"bb190";
      when "10011100" => sample <= x"b8f30";
      when "10011101" => sample <= x"b6d90";
      when "10011110" => sample <= x"b4ca0";
      when "10011111" => sample <= x"b2c60";
      when "10100000" => sample <= x"b0ce0";
      when "10100001" => sample <= x"aee30";
      when "10100010" => sample <= x"ad040";
      when "10100011" => sample <= x"ab320";
      when "10100100" => sample <= x"a96d0";
      when "10100101" => sample <= x"a7b50";
      when "10100110" => sample <= x"a60b0";
      when "10100111" => sample <= x"a46f0";
      when "10101000" => sample <= x"a2e10";
      when "10101001" => sample <= x"a1610";
      when "10101010" => sample <= x"9ff00";
      when "10101011" => sample <= x"9e8d0";
      when "10101100" => sample <= x"9d3a0";
      when "10101101" => sample <= x"9bf60";
      when "10101110" => sample <= x"9ac10";
      when "10101111" => sample <= x"999c0";
      when "10110000" => sample <= x"98870";
      when "10110001" => sample <= x"97820";
      when "10110010" => sample <= x"968d0";
      when "10110011" => sample <= x"95a80";
      when "10110100" => sample <= x"94d30";
      when "10110101" => sample <= x"940f0";
      when "10110110" => sample <= x"935c0";
      when "10110111" => sample <= x"92b90";
      when "10111000" => sample <= x"92270";
      when "10111001" => sample <= x"91a70";
      when "10111010" => sample <= x"91370";
      when "10111011" => sample <= x"90d80";
      when "10111100" => sample <= x"908b0";
      when "10111101" => sample <= x"904e0";
      when "10111110" => sample <= x"90230";
      when "10111111" => sample <= x"90090";
      when "11000000" => sample <= x"90000";
      when "11000001" => sample <= x"90090";
      when "11000010" => sample <= x"90230";
      when "11000011" => sample <= x"904e0";
      when "11000100" => sample <= x"908b0";
      when "11000101" => sample <= x"90d80";
      when "11000110" => sample <= x"91370";
      when "11000111" => sample <= x"91a70";
      when "11001000" => sample <= x"92270";
      when "11001001" => sample <= x"92b90";
      when "11001010" => sample <= x"935c0";
      when "11001011" => sample <= x"940f0";
      when "11001100" => sample <= x"94d30";
      when "11001101" => sample <= x"95a80";
      when "11001110" => sample <= x"968d0";
      when "11001111" => sample <= x"97820";
      when "11010000" => sample <= x"98870";
      when "11010001" => sample <= x"999c0";
      when "11010010" => sample <= x"9ac10";
      when "11010011" => sample <= x"9bf60";
      when "11010100" => sample <= x"9d3a0";
      when "11010101" => sample <= x"9e8d0";
      when "11010110" => sample <= x"9ff00";
      when "11010111" => sample <= x"a1610";
      when "11011000" => sample <= x"a2e10";
      when "11011001" => sample <= x"a46f0";
      when "11011010" => sample <= x"a60b0";
      when "11011011" => sample <= x"a7b50";
      when "11011100" => sample <= x"a96d0";
      when "11011101" => sample <= x"ab320";
      when "11011110" => sample <= x"ad040";
      when "11011111" => sample <= x"aee30";
      when "11100000" => sample <= x"b0ce0";
      when "11100001" => sample <= x"b2c60";
      when "11100010" => sample <= x"b4c90";
      when "11100011" => sample <= x"b6d90";
      when "11100100" => sample <= x"b8f30";
      when "11100101" => sample <= x"bb180";
      when "11100110" => sample <= x"bd480";
      when "11100111" => sample <= x"bf830";
      when "11101000" => sample <= x"c1c70";
      when "11101001" => sample <= x"c4150";
      when "11101010" => sample <= x"c66c0";
      when "11101011" => sample <= x"c8cc0";
      when "11101100" => sample <= x"cb340";
      when "11101101" => sample <= x"cda50";
      when "11101110" => sample <= x"d01e0";
      when "11101111" => sample <= x"d29d0";
      when "11110000" => sample <= x"d5240";
      when "11110001" => sample <= x"d7b10";
      when "11110010" => sample <= x"da450";
      when "11110011" => sample <= x"dcde0";
      when "11110100" => sample <= x"df7d0";
      when "11110101" => sample <= x"e2210";
      when "11110110" => sample <= x"e4ca0";
      when "11110111" => sample <= x"e7760";
      when "11111000" => sample <= x"ea270";
      when "11111001" => sample <= x"ecdb0";
      when "11111010" => sample <= x"ef910";
      when "11111011" => sample <= x"f24b0";
      when "11111100" => sample <= x"f5060";
      when "11111101" => sample <= x"f7c30";
      when "11111110" => sample <= x"fa810";
      when others     => sample <= x"fd410";
   end case;
   end process;
   
end Behavioral;