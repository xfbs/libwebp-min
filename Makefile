OBJS += utils/bit_writer_utils.o
OBJS += utils/thread_utils.o
OBJS += utils/rescaler_utils.o
OBJS += utils/huffman_utils.o
OBJS += utils/huffman_encode_utils.o
OBJS += utils/quant_levels_utils.o
OBJS += utils/quant_levels_dec_utils.o
OBJS += utils/bit_reader_utils.o
OBJS += utils/utils.o
OBJS += utils/color_cache_utils.o
OBJS += utils/filters_utils.o
OBJS += utils/random_utils.o
OBJS += dec/io_dec.o
OBJS += dec/frame_dec.o
OBJS += dec/tree_dec.o
OBJS += dec/alpha_dec.o
OBJS += dec/buffer_dec.o
OBJS += dec/quant_dec.o
OBJS += dec/idec_dec.o
OBJS += dec/webp_dec.o
OBJS += dec/vp8l_dec.o
OBJS += dec/vp8_dec.o
OBJS += dsp/upsampling.o
OBJS += dsp/lossless_sse2.o
OBJS += dsp/lossless_enc_mips_dsp_r2.o
OBJS += dsp/enc_msa.o
OBJS += dsp/filters_mips_dsp_r2.o
OBJS += dsp/rescaler.o
OBJS += dsp/dec_mips_dsp_r2.o
OBJS += dsp/rescaler_neon.o
OBJS += dsp/cost_sse2.o
OBJS += dsp/upsampling_sse41.o
OBJS += dsp/enc_sse41.o
OBJS += dsp/lossless_enc_sse41.o
OBJS += dsp/upsampling_neon.o
OBJS += dsp/filters_sse2.o
OBJS += dsp/lossless_mips_dsp_r2.o
OBJS += dsp/enc_mips_dsp_r2.o
OBJS += dsp/cpu.o
OBJS += dsp/yuv_neon.o
OBJS += dsp/alpha_processing.o
OBJS += dsp/cost_neon.o
OBJS += dsp/enc_mips32.o
OBJS += dsp/filters_neon.o
OBJS += dsp/upsampling_sse2.o
OBJS += dsp/yuv_sse2.o
OBJS += dsp/filters_msa.o
OBJS += dsp/rescaler_msa.o
OBJS += dsp/lossless_neon.o
OBJS += dsp/lossless_enc_msa.o
OBJS += dsp/filters.o
OBJS += dsp/alpha_processing_mips_dsp_r2.o
OBJS += dsp/rescaler_mips_dsp_r2.o
OBJS += dsp/ssim_sse2.o
OBJS += dsp/rescaler_mips32.o
OBJS += dsp/dec_sse41.o
OBJS += dsp/yuv_sse41.o
OBJS += dsp/rescaler_sse2.o
OBJS += dsp/lossless_enc.o
OBJS += dsp/yuv_mips_dsp_r2.o
OBJS += dsp/alpha_processing_neon.o
OBJS += dsp/dec.o
OBJS += dsp/lossless.o
OBJS += dsp/ssim.o
OBJS += dsp/upsampling_msa.o
OBJS += dsp/lossless_enc_sse2.o
OBJS += dsp/yuv.o
OBJS += dsp/enc_neon.o
OBJS += dsp/dec_sse2.o
OBJS += dsp/enc_sse2.o
OBJS += dsp/lossless_enc_neon.o
OBJS += dsp/cost_mips32.o
OBJS += dsp/alpha_processing_sse41.o
OBJS += dsp/dec_neon.o
OBJS += dsp/cost.o
OBJS += dsp/dec_mips32.o
OBJS += dsp/cost_mips_dsp_r2.o
OBJS += dsp/alpha_processing_sse2.o
OBJS += dsp/dec_clip_tables.o
OBJS += dsp/lossless_msa.o
OBJS += dsp/enc.o
OBJS += dsp/lossless_enc_mips32.o
OBJS += dsp/yuv_mips32.o
OBJS += dsp/upsampling_mips_dsp_r2.o
OBJS += dsp/dec_msa.o

OBJS += main.o
OBJS += qdbmp/qdbmp.o

CFLAGS+= -DPRINT_MEM_INFO

BIN = main

$(BIN): $(OBJS)
	$(CC) -o $(BIN) $^

clean:
	$(RM) $(OBJS) $(BIN)
