FasdUAS 1.101.10   ��   ��    k             l     ��  ��    C = � Copyright 2006, Red Sweater Software. All Rights Reserved.     � 	 	 z   �   C o p y r i g h t   2 0 0 6 ,   R e d   S w e a t e r   S o f t w a r e .   A l l   R i g h t s   R e s e r v e d .   
  
 l     ��  ��    R L Permission to copy granted for personal use only. All copies of this script     �   �   P e r m i s s i o n   t o   c o p y   g r a n t e d   f o r   p e r s o n a l   u s e   o n l y .   A l l   c o p i e s   o f   t h i s   s c r i p t      l     ��  ��    T N must retain this copyright information and all lines of comments below, up to     �   �   m u s t   r e t a i n   t h i s   c o p y r i g h t   i n f o r m a t i o n   a n d   a l l   l i n e s   o f   c o m m e n t s   b e l o w ,   u p   t o      l     ��  ��    H B and including the line indicating "End of Red Sweater Comments".      �   �   a n d   i n c l u d i n g   t h e   l i n e   i n d i c a t i n g   " E n d   o f   R e d   S w e a t e r   C o m m e n t s " .        l     ��������  ��  ��        l     ��  ��    S M Any commercial distribution of this code must be licensed from the Copyright     �   �   A n y   c o m m e r c i a l   d i s t r i b u t i o n   o f   t h i s   c o d e   m u s t   b e   l i c e n s e d   f r o m   t h e   C o p y r i g h t     !   l     �� " #��   " #  owner, Red Sweater Software.    # � $ $ :   o w n e r ,   R e d   S w e a t e r   S o f t w a r e . !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) \ V This script alters the color of the frontmost Terminal window to be something random.    * � + + �   T h i s   s c r i p t   a l t e r s   t h e   c o l o r   o f   t h e   f r o n t m o s t   T e r m i n a l   w i n d o w   t o   b e   s o m e t h i n g   r a n d o m . (  , - , l     ��������  ��  ��   -  . / . l     �� 0 1��   0 "  End of Red Sweater Comments    1 � 2 2 8   E n d   o f   R e d   S w e a t e r   C o m m e n t s /  3 4 3 l     ��������  ��  ��   4  5 6 5 l     �� 7 8��   7 4 . This nasty constant might as well be a global    8 � 9 9 \   T h i s   n a s t y   c o n s t a n t   m i g h t   a s   w e l l   b e   a   g l o b a l 6  : ; : p       < < ������ (0 kcolorvaluemaximum kColorValueMaximum��   ;  = > = l     ?���� ? r      @ A @ m     ����   �� A o      ���� (0 kcolorvaluemaximum kColorValueMaximum��  ��   >  B C B l     ��������  ��  ��   C  D E D l     �� F G��   F / ) Choose a random color for the background    G � H H R   C h o o s e   a   r a n d o m   c o l o r   f o r   t h e   b a c k g r o u n d E  I J I l    K���� K r     L M L ]     N O N l   	 P���� P I   	������
�� .sysorandnmbr    ��� nmbr��  ��  ��  ��   O o   	 
���� (0 kcolorvaluemaximum kColorValueMaximum M o      ���� 0 	randomred 	randomRed��  ��   J  Q R Q l    S���� S r     T U T ]     V W V l    X���� X I   ������
�� .sysorandnmbr    ��� nmbr��  ��  ��  ��   W o    ���� (0 kcolorvaluemaximum kColorValueMaximum U o      ���� 0 randomgreen randomGreen��  ��   R  Y Z Y l   ! [���� [ r    ! \ ] \ ]     ^ _ ^ l    `���� ` I   ������
�� .sysorandnmbr    ��� nmbr��  ��  ��  ��   _ o    ���� (0 kcolorvaluemaximum kColorValueMaximum ] o      ���� 0 
randomblue 
randomBlue��  ��   Z  a b a l  " ) c���� c r   " ) d e d J   " ' f f  g h g o   " #���� 0 	randomred 	randomRed h  i j i o   # $���� 0 randomgreen randomGreen j  k�� k o   $ %���� 0 
randomblue 
randomBlue��   e o      ���� &0 mybackgroundcolor myBackgroundColor��  ��   b  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p > 8 Select appropriate text colors based on that background    q � r r p   S e l e c t   a p p r o p r i a t e   t e x t   c o l o r s   b a s e d   o n   t h a t   b a c k g r o u n d o  s t s l  * ? u���� u r   * ? v w v n  * 0 x y x I   + 0�� z���� .0 contrastingtextcolors ContrastingTextColors z  {�� { o   + ,���� &0 mybackgroundcolor myBackgroundColor��  ��   y  f   * + w J       | |  } ~ } o      ���� 0 mytextcolor myTextColor ~  ��  o      ���� 0 myboldcolor myBoldColor��  ��  ��   t  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � / ) Now inflict them on the frontmost window    � � � � R   N o w   i n f l i c t   t h e m   o n   t h e   f r o n t m o s t   w i n d o w �  � � � l  @ g ����� � O   @ g � � � k   D f � �  � � � r   D J � � � 4   D H�� �
�� 
cwin � m   F G����  � o      ���� 0 targetwindow targetWindow �  � � � r   K P � � � o   K L���� &0 mybackgroundcolor myBackgroundColor � n       � � � 1   M O��
�� 
pbcl � o   L M���� 0 targetwindow targetWindow �  � � � r   Q V � � � o   Q R���� 0 mytextcolor myTextColor � n       � � � 1   S U��
�� 
pcuc � o   R S���� 0 targetwindow targetWindow �  � � � r   W ^ � � � o   W X���� 0 mytextcolor myTextColor � n       � � � 1   Y ]��
�� 
ptxc � o   X Y���� 0 targetwindow targetWindow �  ��� � r   _ f � � � o   _ `���� 0 myboldcolor myBoldColor � n       � � � 1   a e��
�� 
pbtc � o   ` a���� 0 targetwindow targetWindow��   � m   @ A � ��                                                                                  trmx  alis    j  Macintosh HD               ��u�H+   f6Terminal.app                                                    ���w�        ����  	                	Utilities     �ڭ�      �wG�     f6 f5  0Macintosh HD:Applications:Utilities:Terminal.app    T e r m i n a l . a p p    M a c i n t o s h   H D  #Applications/Utilities/Terminal.app   / ��  ��  ��   �  � � � l     ��������  ��  ��   �  ��� � i      � � � I      �� ����� .0 contrastingtextcolors ContrastingTextColors �  ��� � o      ���� 0 mycolor myColor��  ��   � k     ` � �  � � � r      � � � J      � �  � � � o     ���� (0 kcolorvaluemaximum kColorValueMaximum �  � � � o    ���� (0 kcolorvaluemaximum kColorValueMaximum �  � � � o    ���� (0 kcolorvaluemaximum kColorValueMaximum �  ��� � o    ���� (0 kcolorvaluemaximum kColorValueMaximum��   � o      ���� 0 
whitecolor 
whiteColor �  � � � r   	  � � � J   	  � �  � � � m   	 
����   �@ �  � � � m   
 ����   �@ �  � � � m    ����   �@ �  ��� � o    ���� (0 kcolorvaluemaximum kColorValueMaximum��   � o      ����  0 lightgreycolor lightGreyColor �  � � � r     � � � J     � �  � � � m    ����   �  � � � m    ����   �  � � � m    ����   �  ��� � o    ���� (0 kcolorvaluemaximum kColorValueMaximum��   � o      ���� 0 
blackcolor 
blackColor �  � � � r    # � � � J    ! � �  � � � m    ����N  �  � � � m    ��N  �  � � � m    �~�~N  �  ��} � o    �|�| (0 kcolorvaluemaximum kColorValueMaximum�}   � o      �{�{ 0 darkgreycolor darkGreyColor �  � � � l  $ $�z�y�x�z  �y  �x   �  � � � l  $ $�w � ��w   � 0 * From http://www.wilsonmar.com/1colors.htm    � � � � T   F r o m   h t t p : / / w w w . w i l s o n m a r . c o m / 1 c o l o r s . h t m �  � � � r   $ , � � � ^   $ * � � � l  $ ( ��v�u � n   $ ( � � � 4   % (�t �
�t 
cobj � m   & '�s�s  � o   $ %�r�r 0 mycolor myColor�v  �u   � o   ( )�q�q (0 kcolorvaluemaximum kColorValueMaximum � o      �p�p 0 myred myRed �  � � � r   - 5 � � � ^   - 3 � � � l  - 1 ��o�n � n   - 1 � � � 4   . 1�m �
�m 
cobj � m   / 0�l�l  � o   - .�k�k 0 mycolor myColor�o  �n   � o   1 2�j�j (0 kcolorvaluemaximum kColorValueMaximum � o      �i�i 0 mygreen myGreen �  � � � r   6 > �  � ^   6 < l  6 :�h�g n   6 : 4   7 :�f
�f 
cobj m   8 9�e�e  o   6 7�d�d 0 mycolor myColor�h  �g   o   : ;�c�c (0 kcolorvaluemaximum kColorValueMaximum  o      �b�b 0 myblue myBlue �  r   ? L	
	 [   ? J [   ? F l  ? B�a�` ]   ? B m   ? @ ?�333333 o   @ A�_�_ 0 myred myRed�a  �`   l  B E�^�] ]   B E m   B C ?��G�z� o   C D�\�\ 0 mygreen myGreen�^  �]   l  F I�[�Z ]   F I m   F G ?�(�\) o   G H�Y�Y 0 myblue myBlue�[  �Z  
 o      �X�X 0 magicy magicY �W Z   M `�V l  M P�U�T A   M P !  o   M N�S�S 0 magicy magicY! m   N O"" ?�      �U  �T   L   S X## J   S W$$ %&% o   S T�R�R 0 
whitecolor 
whiteColor& '�Q' o   T U�P�P  0 lightgreycolor lightGreyColor�Q  �V   L   [ `(( J   [ _)) *+* o   [ \�O�O 0 
blackcolor 
blackColor+ ,�N, o   \ ]�M�M 0 darkgreycolor darkGreyColor�N  �W  ��       �L-./�K0123456�J�I�H�G�F�E�L  - �D�C�B�A�@�?�>�=�<�;�:�9�8�7�6�5�D .0 contrastingtextcolors ContrastingTextColors
�C .aevtoappnull  �   � ****�B (0 kcolorvaluemaximum kColorValueMaximum�A 0 	randomred 	randomRed�@ 0 randomgreen randomGreen�? 0 
randomblue 
randomBlue�> &0 mybackgroundcolor myBackgroundColor�= 0 mytextcolor myTextColor�< 0 myboldcolor myBoldColor�; 0 targetwindow targetWindow�:  �9  �8  �7  �6  �5  . �4 ��3�278�1�4 .0 contrastingtextcolors ContrastingTextColors�3 �09�0 9  �/�/ 0 mycolor myColor�2  7 	�.�-�,�+�*�)�(�'�&�. 0 mycolor myColor�- 0 
whitecolor 
whiteColor�,  0 lightgreycolor lightGreyColor�+ 0 
blackcolor 
blackColor�* 0 darkgreycolor darkGreyColor�) 0 myred myRed�( 0 mygreen myGreen�' 0 myblue myBlue�& 0 magicy magicY8 	�%�$�#�"�!"�% (0 kcolorvaluemaximum kColorValueMaximum�$ �#   �@�"N 
�! 
cobj�1 a�����vE�O�����vE�Ojjj��vE�O�����vE�O��k/�!E�O��l/�!E�O��m/�!E�O� � � E�O�� 
��lvY ��lv/ � :��;<�
�  .aevtoappnull  �   � ****: k     g==  =>>  I??  Q@@  YAA  aBB  sCC  ���  �  �  ;  < ����������� ��������   ��� (0 kcolorvaluemaximum kColorValueMaximum
� .sysorandnmbr    ��� nmbr� 0 	randomred 	randomRed� 0 randomgreen randomGreen� 0 
randomblue 
randomBlue� &0 mybackgroundcolor myBackgroundColor� .0 contrastingtextcolors ContrastingTextColors
� 
cobj� 0 mytextcolor myTextColor� 0 myboldcolor myBoldColor
� 
cwin� 0 targetwindow targetWindow
� 
pbcl
� 
pcuc
� 
ptxc
� 
pbtc� h�E�O*j � E�O*j � E�O*j � E�O���mvE�O)�k+ E[�k/E�Z[�l/E�ZO� $*�k/E�O���,FO���,FO��a ,FO��a ,FU�K   ��0 @�z*�7�1 @���p|�$2 @黱�!�3 �
D�
 D  0124 �	E�	 E  �����   ���   ���   ���   ��5 �F� F  ���� �   �@�   �@�   �@�    ��6 GG  �������
�� 
cwin��=,
�� kfrmID  �J  �I  �H  �G  �F  �E  ascr  ��ޭ