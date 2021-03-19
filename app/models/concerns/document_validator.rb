class DocumentValidator < ActiveModel::EachValidator
    def validate_each record, attribute, value
        type = if options.key? :type then options[:type] else 'any' end

        availableTypes = ['any', 'cpf', 'cnpj']
        if (!availableTypes.include?(type))
            record.errors.add attribute, 'must be a valid document number'
            return
        end

        if (type == 'any' && !self.validateCpf(value) && !self.validateCnpj(value))
            record.errors.add attribute, 'must be a valid document number'
            return
        end

        if (type == 'cpf' && !self.validateCpf(value))
            record.errors.add attribute, 'must be a valid cpf number'
            return
        end

        if (type == 'cnpj' && !self.validateCnpj(value))
            record.errors.add attribute, 'must be a valid cnpj number'
            return
        end
    end

    private

    def validateCpf cpf
        puts cpf

        if (cpf.length != 11)
            return false
        end

        if (
            cpf == '00000000000' ||
            cpf == '11111111111' ||
            cpf == '22222222222' ||
            cpf == '33333333333' ||
            cpf == '44444444444' ||
            cpf == '55555555555' ||
            cpf == '66666666666' ||
            cpf == '77777777777' ||
            cpf == '88888888888' ||
            cpf == '99999999999'
        )
            return false
        end

        cpfArray = cpf.split ''

        digitSum1 = 0
        cpfArray.slice(0, 9).each_with_index do |item, index|
            digitSum1 += item.to_i * (10 - index.to_i)
        end

        mod1   = (digitSum1 * 10) % 11
        digit1 = mod1 == 10 || mod1 == 11 ? 0 : mod1
        if (digit1 != cpfArray[9].to_i)
            return false
        end

        digitSum2 = 0
        cpfArray.slice(0, 10).each_with_index do |item, index|
            digitSum2 += item.to_i * (11 - index.to_i)
        end

        mod2   = (digitSum2 * 10) % 11
        digit2 = mod2 == 10 || mod2 == 11 ? 0 : mod2
        if (digit2 != cpfArray[10].to_i)
            return false
        end

        return true
    end

    def validateCnpj cnpj
        if (cnpj.length != 14)
            return false
        end

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
            digitSum1 += item.to_i * ((index.to_i % 8) + 2)
        end

        mod1   = digitSum1 % 11
        digit1 = mod1 == 0 || mod1 == 1 ? 0 : 11 - mod1
        if (digit1 != cnpjArray[12].to_i)
            return false
        end

        digitSum2 = 0
        cnpjArray.slice(0, 13).reverse().each_with_index do |item, index|
            digitSum2 += item.to_i * ((index.to_i % 8) + 2)
        end

        mod2   = digitSum2 % 11
        digit2 = mod2 == 0 || mod2 == 1 ? 0 : 11 - mod2
        if (digit2 != cnpjArray[13].to_i)
            return false
        end

        return true
    end
end