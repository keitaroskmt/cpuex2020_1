.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 28
# ------------ Text Section -------------------
.section	".text"
	j	min_caml_start
# ------------ libmincaml.S -------------------
# min_caml_print_char
min_caml_print_char:
	out	%v0
	jr	%ra
# min_caml_read_int
min_caml_read_int:
	addi	%v0, %zero, 0
	in	%v0
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 8
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 16
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 24
	or	%v0, %v0, %v1
	jr	%ra
# min_caml_read_float
min_caml_read_float:
	addi	%v0, %zero, 0
	in	%v0
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 8
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 16
	or	%v0, %v0, %v1
	addi	%v1, %zero, 0
	in	%v1
	sll	%v1, %v1, 24
	or	%v0, %v0, %v1
	sw	%v0, 0(%hp)
	flw	%f0, 0(%hp)
	jr	%ra
#  min_caml_create_array
min_caml_create_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_array_loop:
	bne	%a0, %zero, create_array_cont
	jr	%ra
create_array_cont:
	sw	%v1, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 1
	j	create_array_loop
#  min_caml_create_float_array
min_caml_create_float_array:
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	bne	%a0, %zero, create_float_array_cont
	jr	%ra
create_float_array_cont:
	fsw	%f0, 0(%hp)
	addi	%a0, %a0, -1
	addi	%hp, %hp, 1
	j	create_float_array_loop
#  min_caml_create_extarray
min_caml_create_extarray:
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0
create_extarray_loop:
	bne	%a1, %zero, create_extarray_cont
	jr	%ra
create_extarray_cont:
	sw	%v1, 0(%a0)
	addi	%a1, %a1, -1
	addi	%a0, %a0, 1
	j	create_extarray_loop
#  min_caml_create_float_extarray
min_caml_create_float_extarray:
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0
create_float_extarray_loop:
	bne	%a0, %zero, create_float_extarray_cont
	jr	%ra
create_float_extarray_cont:
	fsw	%f0, 0(%v1)
	addi	%a0, %a0, -1
	addi	%v1, %v1, 1
	j	create_float_extarray_loop
# ------------ body ---------------------------
f.295.520:
	fmov	%f16, %f0
	fmov	%f0, %f1
	fblt	%f16, %f0, fbgt_else.1185
	flw	%f1, 27(%zero)
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1186
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1187
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1188
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1189
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1190
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1191
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1192
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1193
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1194
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1195
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1196
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1197
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1198
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1199
	fmul	%f0, %f1, %f0
	fblt	%f16, %f0, fbgt_else.1200
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16
	j	f.295.520
fbgt_else.1200:
	jr	%ra
fbgt_else.1199:
	jr	%ra
fbgt_else.1198:
	jr	%ra
fbgt_else.1197:
	jr	%ra
fbgt_else.1196:
	jr	%ra
fbgt_else.1195:
	jr	%ra
fbgt_else.1194:
	jr	%ra
fbgt_else.1193:
	jr	%ra
fbgt_else.1192:
	jr	%ra
fbgt_else.1191:
	jr	%ra
fbgt_else.1190:
	jr	%ra
fbgt_else.1189:
	jr	%ra
fbgt_else.1188:
	jr	%ra
fbgt_else.1187:
	jr	%ra
fbgt_else.1186:
	jr	%ra
fbgt_else.1185:
	jr	%ra
g.299.524:
	flw	%f17, 1(%k1)
	fblt	%f0, %f17, fbgt_else.1201
	fblt	%f0, %f1, fbgt_else.1202
	fsub	%f0, %f0, %f1
	flw	%f16, 27(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1203
	fblt	%f0, %f1, fbgt_else.1204
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1205
	fblt	%f0, %f1, fbgt_else.1206
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1207
	fblt	%f0, %f1, fbgt_else.1208
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1208:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1207:
	jr	%ra
fbgt_else.1206:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1209
	fblt	%f0, %f1, fbgt_else.1210
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1210:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1209:
	jr	%ra
fbgt_else.1205:
	jr	%ra
fbgt_else.1204:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1211
	fblt	%f0, %f1, fbgt_else.1212
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1213
	fblt	%f0, %f1, fbgt_else.1214
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1214:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1213:
	jr	%ra
fbgt_else.1212:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1215
	fblt	%f0, %f1, fbgt_else.1216
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1216:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1215:
	jr	%ra
fbgt_else.1211:
	jr	%ra
fbgt_else.1203:
	jr	%ra
fbgt_else.1202:
	flw	%f16, 27(%zero)
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1217
	fblt	%f0, %f1, fbgt_else.1218
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1219
	fblt	%f0, %f1, fbgt_else.1220
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1221
	fblt	%f0, %f1, fbgt_else.1222
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1222:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1221:
	jr	%ra
fbgt_else.1220:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1223
	fblt	%f0, %f1, fbgt_else.1224
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1224:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1223:
	jr	%ra
fbgt_else.1219:
	jr	%ra
fbgt_else.1218:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1225
	fblt	%f0, %f1, fbgt_else.1226
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1227
	fblt	%f0, %f1, fbgt_else.1228
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1228:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1227:
	jr	%ra
fbgt_else.1226:
	fdiv	%f1, %f1, %f16
	fblt	%f0, %f17, fbgt_else.1229
	fblt	%f0, %f1, fbgt_else.1230
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1230:
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.1229:
	jr	%ra
fbgt_else.1225:
	jr	%ra
fbgt_else.1217:
	jr	%ra
fbgt_else.1201:
	jr	%ra
cos.221:
	fsw	%f8, 0(%sp)
	fsw	%f7, 1(%sp)
	fsw	%f6, 2(%sp)
	sw	%ra, 3(%sp)
	flw	%f7, 26(%zero)
	fabs	%f8, %f0
	flw	%f6, 25(%zero)
	fblt	%f8, %f6, fbgt_else.1231
	flw	%f0, 24(%zero)
	fblt	%f8, %f0, fbgt_else.1233
	flw	%f0, 23(%zero)
	fblt	%f8, %f0, fbgt_else.1235
	flw	%f0, 22(%zero)
	fblt	%f8, %f0, fbgt_else.1237
	flw	%f0, 21(%zero)
	fblt	%f8, %f0, fbgt_else.1239
	flw	%f0, 20(%zero)
	fblt	%f8, %f0, fbgt_else.1241
	flw	%f0, 19(%zero)
	fblt	%f8, %f0, fbgt_else.1243
	flw	%f0, 18(%zero)
	fblt	%f8, %f0, fbgt_else.1245
	flw	%f0, 17(%zero)
	fblt	%f8, %f0, fbgt_else.1247
	flw	%f0, 16(%zero)
	fblt	%f8, %f0, fbgt_else.1249
	flw	%f0, 15(%zero)
	fblt	%f8, %f0, fbgt_else.1251
	flw	%f0, 14(%zero)
	fblt	%f8, %f0, fbgt_else.1253
	flw	%f0, 13(%zero)
	fblt	%f8, %f0, fbgt_else.1255
	flw	%f0, 12(%zero)
	fblt	%f8, %f0, fbgt_else.1257
	flw	%f0, 11(%zero)
	fblt	%f8, %f0, fbgt_else.1259
	flw	%f1, 10(%zero)
	fmov	%f0, %f8
	addi	%sp, %sp, 4
	jal	f.295.520
	addi	%sp, %sp, -4
	j	fbgt_cont.1260
fbgt_else.1259:
fbgt_cont.1260:
	j	fbgt_cont.1258
fbgt_else.1257:
fbgt_cont.1258:
	j	fbgt_cont.1256
fbgt_else.1255:
fbgt_cont.1256:
	j	fbgt_cont.1254
fbgt_else.1253:
fbgt_cont.1254:
	j	fbgt_cont.1252
fbgt_else.1251:
fbgt_cont.1252:
	j	fbgt_cont.1250
fbgt_else.1249:
fbgt_cont.1250:
	j	fbgt_cont.1248
fbgt_else.1247:
fbgt_cont.1248:
	j	fbgt_cont.1246
fbgt_else.1245:
fbgt_cont.1246:
	j	fbgt_cont.1244
fbgt_else.1243:
fbgt_cont.1244:
	j	fbgt_cont.1242
fbgt_else.1241:
fbgt_cont.1242:
	j	fbgt_cont.1240
fbgt_else.1239:
fbgt_cont.1240:
	j	fbgt_cont.1238
fbgt_else.1237:
fbgt_cont.1238:
	j	fbgt_cont.1236
fbgt_else.1235:
fbgt_cont.1236:
	j	fbgt_cont.1234
fbgt_else.1233:
fbgt_cont.1234:
	j	fbgt_cont.1232
fbgt_else.1231:
	fmov	%f0, %f6
fbgt_cont.1232:
	add	%a0, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, g.299.524
	sw	%a1, 0(%a0)
	fsw	%f6, 1(%a0)
	fblt	%f8, %f6, fbgt_else.1261
	fblt	%f8, %f0, fbgt_else.1263
	fsub	%f8, %f8, %f0
	flw	%f16, 27(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1265
	fblt	%f8, %f0, fbgt_else.1267
	fsub	%f8, %f8, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1269
	fblt	%f8, %f1, fbgt_else.1271
	fsub	%f0, %f8, %f1
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
	j	fbgt_cont.1272
fbgt_else.1271:
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	fmov	%f0, %f8
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
fbgt_cont.1272:
	j	fbgt_cont.1270
fbgt_else.1269:
fbgt_cont.1270:
	j	fbgt_cont.1268
fbgt_else.1267:
	fdiv	%f1, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1273
	fblt	%f8, %f1, fbgt_else.1275
	fsub	%f0, %f8, %f1
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
	j	fbgt_cont.1276
fbgt_else.1275:
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	fmov	%f0, %f8
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
fbgt_cont.1276:
	j	fbgt_cont.1274
fbgt_else.1273:
fbgt_cont.1274:
fbgt_cont.1268:
	j	fbgt_cont.1266
fbgt_else.1265:
fbgt_cont.1266:
	j	fbgt_cont.1264
fbgt_else.1263:
	flw	%f16, 27(%zero)
	fdiv	%f0, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1277
	fblt	%f8, %f0, fbgt_else.1279
	fsub	%f8, %f8, %f0
	fdiv	%f1, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1281
	fblt	%f8, %f1, fbgt_else.1283
	fsub	%f0, %f8, %f1
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
	j	fbgt_cont.1284
fbgt_else.1283:
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	fmov	%f0, %f8
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
fbgt_cont.1284:
	j	fbgt_cont.1282
fbgt_else.1281:
fbgt_cont.1282:
	j	fbgt_cont.1280
fbgt_else.1279:
	fdiv	%f1, %f0, %f16
	fblt	%f8, %f6, fbgt_else.1285
	fblt	%f8, %f1, fbgt_else.1287
	fsub	%f0, %f8, %f1
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
	j	fbgt_cont.1288
fbgt_else.1287:
	fdiv	%f1, %f1, %f16
	addi	%k1, %a0, 0
	fmov	%f0, %f8
	addi	%sp, %sp, 4
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -4
	fmov	%f8, %f0
fbgt_cont.1288:
	j	fbgt_cont.1286
fbgt_else.1285:
fbgt_cont.1286:
fbgt_cont.1280:
	j	fbgt_cont.1278
fbgt_else.1277:
fbgt_cont.1278:
fbgt_cont.1264:
	j	fbgt_cont.1262
fbgt_else.1261:
fbgt_cont.1262:
	fblt	%f8, %f7, fbgt_else.1289
	j	fbgt_cont.1290
fbgt_else.1289:
	addi	%a0, %zero, 1
fbgt_cont.1290:
	fblt	%f8, %f7, fbgt_else.1291
	fsub	%f8, %f8, %f7
	j	fbgt_cont.1292
fbgt_else.1291:
fbgt_cont.1292:
	flw	%f1, 9(%zero)
	fblt	%f8, %f1, fbgt_else.1293
	beqi	%a0, 0, bnei_else.1295
	j	bnei_cont.1296
bnei_else.1295:
	addi	%a0, %zero, 1
bnei_cont.1296:
	j	fbgt_cont.1294
fbgt_else.1293:
fbgt_cont.1294:
	fblt	%f8, %f1, fbgt_else.1297
	fsub	%f8, %f7, %f8
	j	fbgt_cont.1298
fbgt_else.1297:
fbgt_cont.1298:
	flw	%f0, 8(%zero)
	fblt	%f0, %f8, fbgt_else.1299
	fmul	%f17, %f8, %f8
	fmul	%f16, %f17, %f17
	flw	%f1, 4(%zero)
	flw	%f0, 3(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 2(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 1(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	j	fbgt_cont.1300
fbgt_else.1299:
	fsub	%f18, %f1, %f8
	fmul	%f17, %f18, %f18
	fmul	%f16, %f17, %f17
	flw	%f0, 7(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f1, %f18, %f0
	flw	%f0, 6(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 5(%zero)
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
fbgt_cont.1300:
	beqi	%a0, 0, bnei_else.1301
	flw	%f8, 0(%sp)
	flw	%f7, 1(%sp)
	flw	%f6, 2(%sp)
	lw	%ra, 3(%sp)
	jr	%ra
bnei_else.1301:
	flw	%f8, 0(%sp)
	flw	%f7, 1(%sp)
	flw	%f6, 2(%sp)
	lw	%ra, 3(%sp)
	fneg	%f0, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	jal	cos.221
	fmov	%g0, %f0
	ret
