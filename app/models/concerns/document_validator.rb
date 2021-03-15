class DocumentValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
        if (!(self.validateCnpj value))
            record.errors.add attribute, 'must be a valid document number'
        end
    end

    private

    def validateCnpj cnpj
        if (
            cnpj == '00000000000000' ||
            cnpj == '11111111111111' ||
            cnpj == '22222222222222' ||
            cnpj == '33333333333333' ||
            cnpj == '44444444444444' ||
            cnpj == '55555555555555' ||
            cnpj == '66666666666666' ||
            cnpj == '77777777777777' ||
            cnpj == '88888888888888' ||
            cnpj == '99999999999999'
        )
            return false
        end

        cnpjArray = cnpj.split ''

        digitSum1 = 0
        cnpjArray.slice(0, 12).reverse().each_with_index do |item, index|
            puts (item.to_i)
            puts (((index.to_i % 8) + 2))
            puts ('######')
            digitSum1 += item.to_i * ((index.to_i % 8) + 2)
        end

        mod1 = digitSum1 % 11
        if (mod1 != 0 && mod1 != 1 && 11 - (digitSum1 % 11) != cnpjArray[12].to_i)
            return false
        end

        digitSum2 = 0
        cnpjArray.slice(0, 13).reverse().each_with_index do |item, index|
            digitSum2 += item.to_i * ((index.to_i % 8) + 2)
        end

        mod2 = digitSum2 % 11
        if (mod2 != 0 && mod2 != 1 && 11 - (digitSum2 % 11) != cnpjArray[13].to_i)
            return false
        end

        return true
    end
end