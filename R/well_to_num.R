#' Converts well labels to numbers
#' 
#' Converts alpha-numeric well labels to numbers corresponding to positions
#' within a microtitre plate. Either 96 or 384 well plate, in column-wise order
#' or in a column snaking pattern.
#' 
#' @param wells Vector of well identifiers e.g "A01"
#' @param style Either normal, starting at the left hand column at each row
#'     or in a snaking fashion. ('normal' or 'snake')
#' @param plate Number of wells in the complete plate (96 or 384)
#' 
#' @return Vector of numbers
#' 
#' @export
#'
#' @examples
#' well_to_num("A01")
#' 
#' well_to_num("P12", plate = 384)
#' 
#' well_to_num("P12", plate = 384, style = "snake")
#' 
#' wells <- c("A01", "A02", "A03")
#' well_to_num(wells)

well_to_num <- function(wells,
                        style = "normal",
                        plate = 96){

    if(plate == 96){
        if(style == "snake"){
            # dataframe containing all wells in snaking order
            well_list_96_snake <- structure(list(
                well = structure(c(
                    1L, 2L, 3L, 4L, 5L, 6L, 7L, 
                    8L, 9L, 10L, 11L, 12L, 24L, 23L, 22L, 21L, 20L, 19L, 18L, 17L, 
                    16L, 15L, 14L, 13L, 25L, 26L, 27L, 28L, 29L, 30L, 31L, 32L, 33L, 
                    34L, 35L, 36L, 48L, 47L, 46L, 45L, 44L, 43L, 42L, 41L, 40L, 39L, 
                    38L, 37L, 49L, 50L, 51L, 52L, 53L, 54L, 55L, 56L, 57L, 58L, 59L, 
                    60L, 72L, 71L, 70L, 69L, 68L, 67L, 66L, 65L, 64L, 63L, 62L, 61L, 
                    73L, 74L, 75L, 76L, 77L, 78L, 79L, 80L, 81L, 82L, 83L, 84L, 96L, 
                    95L, 94L, 93L, 92L, 91L, 90L, 89L, 88L, 87L, 86L, 85L),
                    .Label = c(
                        "A01", 
                        "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", 
                        "A11", "A12", "B01", "B02", "B03", "B04", "B05", "B06", "B07", 
                        "B08", "B09", "B10", "B11", "B12", "C01", "C02", "C03", "C04", 
                        "C05", "C06", "C07", "C08", "C09", "C10", "C11", "C12", "D01", 
                        "D02", "D03", "D04", "D05", "D06", "D07", "D08", "D09", "D10", 
                        "D11", "D12", "E01", "E02", "E03", "E04", "E05", "E06", "E07", 
                        "E08", "E09", "E10", "E11", "E12", "F01", "F02", "F03", "F04", 
                        "F05", "F06", "F07", "F08", "F09", "F10", "F11", "F12", "G01", 
                        "G02", "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", 
                        "G11", "G12", "H01", "H02", "H03", "H04", "H05", "H06", "H07", 
                        "H08", "H09", "H10", "H11", "H12"),
                    class = "factor")), .Names = "well",
                class = "data.frame", row.names = c(NA, -96L))
            return(which(well_list_96_snake$well %in% wells))
        }
        if(style == "normal"){
            # dataframe containing all wells in order (normal)
            well_list_96 <- structure(list(
                well = structure(1:96,.Label = c(
                    "A01", "A02", 
                    "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11", 
                    "A12", "B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", 
                    "B09", "B10", "B11", "B12", "C01", "C02", "C03", "C04", "C05", 
                    "C06", "C07", "C08", "C09", "C10", "C11", "C12", "D01", "D02", 
                    "D03", "D04", "D05", "D06", "D07", "D08", "D09", "D10", "D11", 
                    "D12", "E01", "E02", "E03", "E04", "E05", "E06", "E07", "E08", 
                    "E09", "E10", "E11", "E12", "F01", "F02", "F03", "F04", "F05", 
                    "F06", "F07", "F08", "F09", "F10", "F11", "F12", "G01", "G02", 
                    "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", "G11", 
                    "G12", "H01", "H02", "H03", "H04", "H05", "H06", "H07", "H08", 
                    "H09", "H10", "H11", "H12"),class = "factor")),
                .Names = "well", class = "data.frame", row.names = c(NA, -96L))
            return(which(well_list_96$well %in% wells))
        } else {stop("Not a valid style. Has to be either 'normal', or 'snake'",
                     call. = FALSE)}
    }
    if(plate == 384){
        if(style == "snake"){
            well_list_384_snake <-
                structure(list(well = structure(c(
                    1L, 2L, 3L, 4L, 5L, 6L, 7L, 
                    8L, 9L, 10L, 11L, 12L, 13L, 14L, 15L, 16L, 17L, 18L, 19L, 20L, 
                    21L, 22L, 23L, 24L, 48L, 47L, 46L, 45L, 44L, 43L, 42L, 41L, 40L, 
                    39L, 38L, 37L, 36L, 35L, 34L, 33L, 32L, 31L, 30L, 29L, 28L, 27L, 
                    26L, 25L, 49L, 50L, 51L, 52L, 53L, 54L, 55L, 56L, 57L, 58L, 59L, 
                    60L, 61L, 62L, 63L, 64L, 65L, 66L, 67L, 68L, 69L, 70L, 71L, 72L, 
                    96L, 95L, 94L, 93L, 92L, 91L, 90L, 89L, 88L, 87L, 86L, 85L, 84L, 
                    83L, 82L, 81L, 80L, 79L, 78L, 77L, 76L, 75L, 74L, 73L, 97L, 98L, 
                    99L, 100L, 101L, 102L, 103L, 104L, 105L, 106L, 107L, 108L, 109L, 
                    110L, 111L, 112L, 113L, 114L, 115L, 116L, 117L, 118L, 119L, 120L, 
                    144L, 143L, 142L, 141L, 140L, 139L, 138L, 137L, 136L, 135L, 134L, 
                    133L, 132L, 131L, 130L, 129L, 128L, 127L, 126L, 125L, 124L, 123L, 
                    122L, 121L, 145L, 146L, 147L, 148L, 149L, 150L, 151L, 152L, 153L, 
                    154L, 155L, 156L, 157L, 158L, 159L, 160L, 161L, 162L, 163L, 164L, 
                    165L, 166L, 167L, 168L, 192L, 191L, 190L, 189L, 188L, 187L, 186L, 
                    185L, 184L, 183L, 182L, 181L, 180L, 179L, 178L, 177L, 176L, 175L, 
                    174L, 173L, 172L, 171L, 170L, 169L, 193L, 194L, 195L, 196L, 197L, 
                    198L, 199L, 200L, 201L, 202L, 203L, 204L, 205L, 206L, 207L, 208L, 
                    209L, 210L, 211L, 212L, 213L, 214L, 215L, 216L, 240L, 239L, 238L, 
                    237L, 236L, 235L, 234L, 233L, 232L, 231L, 230L, 229L, 228L, 227L, 
                    226L, 225L, 224L, 223L, 222L, 221L, 220L, 219L, 218L, 217L, 241L, 
                    242L, 243L, 244L, 245L, 246L, 247L, 248L, 249L, 250L, 251L, 252L, 
                    253L, 254L, 255L, 256L, 257L, 258L, 259L, 260L, 261L, 262L, 263L, 
                    264L, 288L, 287L, 286L, 285L, 284L, 283L, 282L, 281L, 280L, 279L, 
                    278L, 277L, 276L, 275L, 274L, 273L, 272L, 271L, 270L, 269L, 268L, 
                    267L, 266L, 265L, 289L, 290L, 291L, 292L, 293L, 294L, 295L, 296L, 
                    297L, 298L, 299L, 300L, 301L, 302L, 303L, 304L, 305L, 306L, 307L, 
                    308L, 309L, 310L, 311L, 312L, 336L, 335L, 334L, 333L, 332L, 331L, 
                    330L, 329L, 328L, 327L, 326L, 325L, 324L, 323L, 322L, 321L, 320L, 
                    319L, 318L, 317L, 316L, 315L, 314L, 313L, 337L, 338L, 339L, 340L, 
                    341L, 342L, 343L, 344L, 345L, 346L, 347L, 348L, 349L, 350L, 351L, 
                    352L, 353L, 354L, 355L, 356L, 357L, 358L, 359L, 360L, 384L, 383L, 
                    382L, 381L, 380L, 379L, 378L, 377L, 376L, 375L, 374L, 373L, 372L, 
                    371L, 370L, 369L, 368L, 367L, 366L, 365L, 364L, 363L, 362L, 361L
                ), .Label = c("A01", "A02", "A03", "A04", "A05", "A06", "A07", 
                              "A08", "A09", "A10", "A11", "A12", "A13", "A14", "A15", "A16", 
                              "A17", "A18", "A19", "A20", "A21", "A22", "A23", "A24", "B01", 
                              "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09", "B10", 
                              "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "B19", 
                              "B20", "B21", "B22", "B23", "B24", "C01", "C02", "C03", "C04", 
                              "C05", "C06", "C07", "C08", "C09", "C10", "C11", "C12", "C13", 
                              "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21", "C22", 
                              "C23", "C24", "D01", "D02", "D03", "D04", "D05", "D06", "D07", 
                              "D08", "D09", "D10", "D11", "D12", "D13", "D14", "D15", "D16", 
                              "D17", "D18", "D19", "D20", "D21", "D22", "D23", "D24", "E01", 
                              "E02", "E03", "E04", "E05", "E06", "E07", "E08", "E09", "E10", 
                              "E11", "E12", "E13", "E14", "E15", "E16", "E17", "E18", "E19", 
                              "E20", "E21", "E22", "E23", "E24", "F01", "F02", "F03", "F04", 
                              "F05", "F06", "F07", "F08", "F09", "F10", "F11", "F12", "F13", 
                              "F14", "F15", "F16", "F17", "F18", "F19", "F20", "F21", "F22", 
                              "F23", "F24", "G01", "G02", "G03", "G04", "G05", "G06", "G07", 
                              "G08", "G09", "G10", "G11", "G12", "G13", "G14", "G15", "G16", 
                              "G17", "G18", "G19", "G20", "G21", "G22", "G23", "G24", "H01", 
                              "H02", "H03", "H04", "H05", "H06", "H07", "H08", "H09", "H10", 
                              "H11", "H12", "H13", "H14", "H15", "H16", "H17", "H18", "H19", 
                              "H20", "H21", "H22", "H23", "H24", "I01", "I02", "I03", "I04", 
                              "I05", "I06", "I07", "I08", "I09", "I10", "I11", "I12", "I13", 
                              "I14", "I15", "I16", "I17", "I18", "I19", "I20", "I21", "I22", 
                              "I23", "I24", "J01", "J02", "J03", "J04", "J05", "J06", "J07", 
                              "J08", "J09", "J10", "J11", "J12", "J13", "J14", "J15", "J16", 
                              "J17", "J18", "J19", "J20", "J21", "J22", "J23", "J24", "K01", 
                              "K02", "K03", "K04", "K05", "K06", "K07", "K08", "K09", "K10", 
                              "K11", "K12", "K13", "K14", "K15", "K16", "K17", "K18", "K19", 
                              "K20", "K21", "K22", "K23", "K24", "L01", "L02", "L03", "L04", 
                              "L05", "L06", "L07", "L08", "L09", "L10", "L11", "L12", "L13", 
                              "L14", "L15", "L16", "L17", "L18", "L19", "L20", "L21", "L22", 
                              "L23", "L24", "M01", "M02", "M03", "M04", "M05", "M06", "M07", 
                              "M08", "M09", "M10", "M11", "M12", "M13", "M14", "M15", "M16", 
                              "M17", "M18", "M19", "M20", "M21", "M22", "M23", "M24", "N01", 
                              "N02", "N03", "N04", "N05", "N06", "N07", "N08", "N09", "N10", 
                              "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", 
                              "N20", "N21", "N22", "N23", "N24", "O01", "O02", "O03", "O04", 
                              "O05", "O06", "O07", "O08", "O09", "O10", "O11", "O12", "O13", 
                              "O14", "O15", "O16", "O17", "O18", "O19", "O20", "O21", "O22", 
                              "O23", "O24", "P01", "P02", "P03", "P04", "P05", "P06", "P07", 
                              "P08", "P09", "P10", "P11", "P12", "P13", "P14", "P15", "P16", 
                              "P17", "P18", "P19", "P20", "P21", "P22", "P23", "P24"), class = "factor")),
                          .Names = "well", class = "data.frame", row.names = c(NA, -384L)) 
            return(which(well_list_384_snake$well %in% wells))
        }
        if (style == "normal"){
            well_list_384 <- structure(list(
                well = structure(1:384,.Label = c(
                    "A01", "A02", 
                    "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11", 
                    "A12", "A13", "A14", "A15", "A16", "A17", "A18", "A19", "A20", 
                    "A21", "A22", "A23", "A24", "B01", "B02", "B03", "B04", "B05", 
                    "B06", "B07", "B08", "B09", "B10", "B11", "B12", "B13", "B14", 
                    "B15", "B16", "B17", "B18", "B19", "B20", "B21", "B22", "B23", 
                    "B24", "C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", 
                    "C09", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", 
                    "C18", "C19", "C20", "C21", "C22", "C23", "C24", "D01", "D02", 
                    "D03", "D04", "D05", "D06", "D07", "D08", "D09", "D10", "D11", 
                    "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20", 
                    "D21", "D22", "D23", "D24", "E01", "E02", "E03", "E04", "E05", 
                    "E06", "E07", "E08", "E09", "E10", "E11", "E12", "E13", "E14", 
                    "E15", "E16", "E17", "E18", "E19", "E20", "E21", "E22", "E23", 
                    "E24", "F01", "F02", "F03", "F04", "F05", "F06", "F07", "F08", 
                    "F09", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", 
                    "F18", "F19", "F20", "F21", "F22", "F23", "F24", "G01", "G02", 
                    "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", "G11", 
                    "G12", "G13", "G14", "G15", "G16", "G17", "G18", "G19", "G20", 
                    "G21", "G22", "G23", "G24", "H01", "H02", "H03", "H04", "H05", 
                    "H06", "H07", "H08", "H09", "H10", "H11", "H12", "H13", "H14", 
                    "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                    "H24", "I01", "I02", "I03", "I04", "I05", "I06", "I07", "I08", 
                    "I09", "I10", "I11", "I12", "I13", "I14", "I15", "I16", "I17", 
                    "I18", "I19", "I20", "I21", "I22", "I23", "I24", "J01", "J02", 
                    "J03", "J04", "J05", "J06", "J07", "J08", "J09", "J10", "J11", 
                    "J12", "J13", "J14", "J15", "J16", "J17", "J18", "J19", "J20", 
                    "J21", "J22", "J23", "J24", "K01", "K02", "K03", "K04", "K05", 
                    "K06", "K07", "K08", "K09", "K10", "K11", "K12", "K13", "K14", 
                    "K15", "K16", "K17", "K18", "K19", "K20", "K21", "K22", "K23", 
                    "K24", "L01", "L02", "L03", "L04", "L05", "L06", "L07", "L08", 
                    "L09", "L10", "L11", "L12", "L13", "L14", "L15", "L16", "L17", 
                    "L18", "L19", "L20", "L21", "L22", "L23", "L24", "M01", "M02", 
                    "M03", "M04", "M05", "M06", "M07", "M08", "M09", "M10", "M11", 
                    "M12", "M13", "M14", "M15", "M16", "M17", "M18", "M19", "M20", 
                    "M21", "M22", "M23", "M24", "N01", "N02", "N03", "N04", "N05", 
                    "N06", "N07", "N08", "N09", "N10", "N11", "N12", "N13", "N14", 
                    "N15", "N16", "N17", "N18", "N19", "N20", "N21", "N22", "N23", 
                    "N24", "O01", "O02", "O03", "O04", "O05", "O06", "O07", "O08", 
                    "O09", "O10", "O11", "O12", "O13", "O14", "O15", "O16", "O17", 
                    "O18", "O19", "O20", "O21", "O22", "O23", "O24", "P01", "P02", 
                    "P03", "P04", "P05", "P06", "P07", "P08", "P09", "P10", "P11", 
                    "P12", "P13", "P14", "P15", "P16", "P17", "P18", "P19", "P20", 
                    "P21", "P22", "P23", "P24"), class = "factor")),
                    .Names = "well", class = "data.frame", row.names = c(NA, -384L))
            return(which(well_list_384$well %in% wells))
        } else {stop("Not a valid style. Has to be either 'normal', or 'snake'", call. = FALSE)}
    } else {stop("Invalid plate format. Argument has to be 96 or 384", call. = FALSE)}
}
